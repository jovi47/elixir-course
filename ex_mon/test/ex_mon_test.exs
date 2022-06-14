defmodule ExMonTest do
  use ExUnit.Case
  alias ExMon.{Player}

  import ExUnit.CaptureIO

  describe "create_player/4" do
    test "creating a valid player" do
      expected_response = %Player{
        life: 100,
        moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
        name: "Joao"
      }

      assert ExMon.create_player("Joao", :soco, :chute, :cura) == expected_response
    end
  end

  describe "start_game/1" do
    test "the game started correctly" do
      player = Player.build("Joao", :chute, :soco, :cura)

      messages = capture_io(fn -> assert ExMon.start_game(player) == :ok end)

      assert messages =~ "The game is startado"
      assert messages =~ "status: :started"
      assert messages =~ "turn: :player"
    end
  end

  describe "make_move/1" do
    setup %{} do
      player = Player.build("Joao", :chute, :soco, :cura)
      capture_io(fn -> assert ExMon.start_game(player) end)

      :ok
    end

    test "when the move is valid, do the move and the computer makes a move" do
      messages = capture_io(fn -> assert ExMon.make_move(:chute) end)

      assert messages =~ "The Player attacked the compute"
      assert messages =~ "turn: :player"
      assert messages =~ "status: :continue"
    end

    test "when the move is invalid, returns an error message" do
      messages = capture_io(fn -> assert ExMon.make_move(:chuste) end)

      assert messages =~ "Invalid move: chuste."
    end
  end
end
