require_relative '../lib/game_of_life'

describe GameOfLife do
  let(:game_of_life) { GameOfLife.new }

  it 'uses default Conway rules' do
    expect(game_of_life.policy).to be_a(ConwayPolicy)
  end

  it 'uses default number of generations' do
    allow(game_of_life).to receive(:tick)
    default_generations = GameOfLife::DEFAULT_GENERATIONS

    game_of_life.start

    expect(
      game_of_life
    ).to have_received(:tick).exactly(
      default_generations
    ).times
  end

  it 'uses default block pattern' do
    upper_left_block = game_of_life.cells.any? do |c|
      c.x_coord == 1 && c.y_coord == 1
    end
    upper_right_block = game_of_life.cells.any? do |c|
      c.x_coord == 2 && c.y_coord == 1
    end
    lower_left_block = game_of_life.cells.any? do |c|
      c.x_coord == 1 && c.y_coord == 2
    end
    lower_right_block = game_of_life.cells.any? do |c|
      c.x_coord == 2 && c.y_coord == 2
    end

    expect(game_of_life.cells.size).to equal(4)
    expect(upper_left_block).to be(true)
    expect(upper_right_block).to be(true)
    expect(lower_left_block).to be(true)
    expect(lower_right_block).to be(true)
  end

  it 'raises an exception if a grid position has more than one cell' do
    cell = instance_double('Cell', x_coord: 1, y_coord: 2)
    cell_in_same_position = instance_double('Cell', x_coord: 1, y_coord: 2)
    invalid_game_of_life = GameOfLife.new(cells:
      [
        cell,
        cell_in_same_position
      ])

    expect { invalid_game_of_life.start }.to raise_error { |error|
      expect(error.message).to eq('Position violation')
    }
  end
end
