[1mdiff --cc week4/scenes/shop_screen.tscn[m
[1mindex db6e9e0,7fb0c78..0000000[m
[1m--- a/week4/scenes/shop_screen.tscn[m
[1m+++ b/week4/scenes/shop_screen.tscn[m
[36m@@@ -1050,7 -1040,104 +1057,109 @@@[m [mposition = Vector2( 946, 330 [m
  scale = Vector2( -9.94248, 9.94248 )[m
  texture = ExtResource( 25 )[m
  [m
[32m+ [node name="Customer1" type="Sprite" parent="."][m
[32m+ position = Vector2( 270, 66 )[m
[32m+ scale = Vector2( 2.65625, 2.375 )[m
[32m+ texture = ExtResource( 48 )[m
[32m+ script = ExtResource( 50 )[m
[32m+ [m
[32m+ [node name="RequestItemBubble" type="Sprite" parent="Customer1"][m
[32m+ position = Vector2( 27.1059, -6.73685 )[m
[32m+ texture = ExtResource( 26 )[m
[32m+ [m
[32m+ [node name="ReqItem" type="Sprite" parent="Customer1/RequestItemBubble"][m
[32m+ position = Vector2( -0.611786, -2.10527 )[m
[32m+ scale = Vector2( 0.367647, 0.421053 )[m
[32m+ texture = ExtResource( 6 )[m
[32m+ [m
[32m+ [node name="PopupPanel" type="PopupPanel" parent="."][m
[32m+ visible = true[m
[32m+ margin_left = 169.0[m
[32m+ margin_top = 121.0[m
[32m+ margin_right = 367.0[m
[32m+ margin_bottom = 239.0[m
[32m+ [m
[32m+ [node name="Sprite" type="Sprite" parent="PopupPanel"][m
[32m+ position = Vector2( 99.5, 58.5 )[m
[32m+ scale = Vector2( 14.1875, 13 )[m
[32m+ texture = ExtResource( 16 )[m
[32m+ [m
[32m+ [node name="VBoxContainer" type="VBoxContainer" parent="PopupPanel"][m
[32m+ margin_left = 4.0[m
[32m+ margin_top = 4.0[m
[32m+ margin_right = 194.0[m
[32m+ margin_bottom = 114.0[m
[32m+ [m
[32m+ [node name="ExitButton" type="Sprite" parent="PopupPanel/VBoxContainer"][m
[32m+ position = Vector2( 176, 9 )[m
[32m+ scale = Vector2( 0.0622776, 0.0596847 )[m
[32m+ texture = ExtResource( 32 )[m
[32m+ [m
[32m+ [node name="ItemName" type="Label" parent="PopupPanel/VBoxContainer"][m
[32m+ margin_right = 190.0[m
[32m+ margin_bottom = 14.0[m
[32m+ text = "Item Name"[m
[32m+ align = 1[m
[32m+ [m
[32m+ [node name="Label2" type="Label" parent="PopupPanel/VBoxContainer"][m
[32m+ margin_top = 18.0[m
[32m+ margin_right = 190.0[m
[32m+ margin_bottom = 32.0[m
[32m+ align = 1[m
[32m+ [m
[32m+ [node name="Label3" type="Label" parent="PopupPanel/VBoxContainer"][m
[32m+ margin_top = 36.0[m
[32m+ margin_right = 190.0[m
[32m+ margin_bottom = 50.0[m
[32m+ text = "0"[m
[32m+ align = 1[m
[32m+ [m
[32m+ [node name="Label4" type="Label" parent="PopupPanel/VBoxContainer"][m
[32m+ margin_top = 54.0[m
[32m+ margin_right = 190.0[m
[32m+ margin_bottom = 68.0[m
[32m+ align = 1[m
[32m+ [m
[32m+ [node name="Sprite" type="Sprite" parent="PopupPanel/VBoxContainer"][m
[32m+ position = Vector2( 93.875, 40.375 )[m
[32m+ scale = Vector2( 2.72059, 2.66176 )[m
[32m+ texture = ExtResource( 17 )[m
[32m+ [m
[32m+ [node name="HBoxContainer" type="HBoxContainer" parent="PopupPanel/VBoxContainer"][m
[32m+ margin_top = 72.0[m
[32m+ margin_right = 190.0[m
[32m+ margin_bottom = 86.0[m
[32m+ alignment = 1[m
[32m+ [m
[32m+ [node name="Label" type="Label" parent="PopupPanel/VBoxContainer/HBoxContainer"][m
[32m+ margin_left = 73.0[m
[32m+ margin_right = 105.0[m
[32m+ margin_bottom = 14.0[m
[32m+ text = "Cost:"[m
[32m+ [m
[32m+ [node name="ItemPrice" type="Label" parent="PopupPanel/VBoxContainer/HBoxContainer"][m
[32m+ margin_left = 109.0[m
[32m+ margin_right = 117.0[m
[32m+ margin_bottom = 14.0[m
[32m+ text = "0"[m
[32m+ [m
[32m+ [node name="ItemSprite" type="Sprite" parent="PopupPanel/VBoxContainer/HBoxContainer"][m
[32m+ position = Vector2( 134, 6 )[m
[32m+ scale = Vector2( 0.5625, 0.5625 )[m
[32m+ texture = ExtResource( 6 )[m
[32m+ [m
[32m+ [node name="Button" type="Button" parent="PopupPanel/VBoxContainer"][m
[32m+ margin_top = 90.0[m
[32m+ margin_right = 190.0[m
[32m+ margin_bottom = 110.0[m
[32m+ text = "Give Item"[m
[32m+ script = ExtResource( 52 )[m
[32m+ [m
  [connection signal="popup_hide" from="build pop up" to="machines" method="_on_build_pop_up_popup_hide"][m
  [connection signal="pressed" from="build pop up/pop up content/pop up text/Build" to="machines" method="_on_Build_pressed"][m
[32m++<<<<<<< Updated upstream[m
[32m +[connection signal="popup_hide" from="upgrade pop up" to="machines" method="_on_upgrade_pop_up_popup_hide"][m
[32m +[connection signal="pressed" from="upgrade pop up/pop up content/pop up text/upgrade" to="machines" method="_on_upgrade_pressed"][m
[32m++=======[m
[32m+ [connection signal="pressed" from="PopupPanel/VBoxContainer/Button" to="PopupPanel/VBoxContainer/Button" method="_on_Button_pressed"][m
[32m++>>>>>>> Stashed changes[m
[1mdiff --cc week4/scripts/globals.gd[m
[1mindex f0cf6aa,0613401..0000000[m
[1m--- a/week4/scripts/globals.gd[m
[1m+++ b/week4/scripts/globals.gd[m
[36m@@@ -15,7 -15,7 +15,11 @@@[m [mextends Nod[m
  [m
  # Player's balance[m
  var COINS = 0[m
[32m++<<<<<<< Updated upstream[m
[32m +var EMERALDS = 0 [m
[32m++=======[m
[32m+ var EMERALDS = 0[m
[32m++>>>>>>> Stashed changes[m
  var RUBY = 0[m
  var DIAMONDS = 0[m
  [m
