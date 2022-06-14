defmodule ExMon.GameTest do
  alias ExMon.{Player, Game}
  use ExUnit.Case

  describe "start/2" do
    test "starts the game state" do
      player = Player.build("Joao", :chute, :soco, :cura)
      computer = Player.build("Computer", :chute, :soco, :cura)
      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "returns the current game state" do
      player = Player.build("Joao", :chute, :soco, :cura)
      computer = Player.build("Computer", :chute, :soco, :cura)
      Game.start(player, computer)

      expected_response = %{
        computer: %Player{
          life: 100,
          moves: %{
            move_avg: :soco,
            move_heal: :cura,
            move_rnd: :chute
          },
          name: "Joao"
        },
        player: %Player{
          life: 100,
          moves: %{
            move_avg: :soco,
            move_heal: :cura,
            move_rnd: :chute
          },
          name: "Computer"
        },
        status: :started,
        turn: :player
      }

      assert Game.info() == expected_response
    end
  end

  describe "update/1" do
    test "returns the game state updated" do
      player = Player.build("Joao", :chute, :soco, :cura)
      computer = Player.build("Computer", :chute, :soco, :cura)
      Game.start(player, computer)

      expected_response = %{
        computer: %Player{
          life: 100,
          moves: %{
            move_avg: :soco,
            move_heal: :cura,
            move_rnd: :chute
          },
          name: "Joao"
        },
        player: %Player{
          life: 100,
          moves: %{
            move_avg: :soco,
            move_heal: :cura,
            move_rnd: :chute
          },
          name: "Computer"
        },
        status: :started,
        turn: :player
      }

      assert Game.info() == expected_response

      new_state = %{
        computer: %Player{
          life: 75,
          moves: %{
            move_avg: :soco,
            move_heal: :cura,
            move_rnd: :chute
          },
          name: "Joao"
        },
        player: %Player{
          life: 66,
          moves: %{
            move_avg: :soco,
            move_heal: :cura,
            move_rnd: :chute
          },
          name: "Computer"
        },
        status: :started,
        turn: :player
      }
      Game.update(new_state)

      expected_response = %{new_state | turn: :computer, status: :continue}
      assert Game.info() == expected_response
    end
  end
end
