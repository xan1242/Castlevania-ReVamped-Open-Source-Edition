/// @description setup
pause = true;

rebinding_verb = undefined;

menu_selection = 0;

lock_confirm = InputBindingGet(InputPlayerUsingGamepad(), INPUT_VERB.ACCEPT)
lock_deny = InputBindingGet(InputPlayerUsingGamepad(), INPUT_VERB.CANCEL)

instance_create(x,y,objFadeInShutter)