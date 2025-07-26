function __InputConfigVerbs()
{
    enum INPUT_VERB
    {
        //Add your own verbs here!
        UP,
        DOWN,
        LEFT,
        RIGHT,
        ACCEPT,
        CANCEL,
        PAUSE,
		MAP,
        JUMP,
        ATTACK,
        SUBWEAPON,
        DASH,
        SWAP,
        AIMLOCK,
		VERB_COUNT,
    }
    
    enum INPUT_CLUSTER
    {
        //Add your own clusters here!
        //Clusters are used for two-dimensional checkers (InputDirection() etc.)
        NAVIGATION,
    }
    
    InputDefineVerb(INPUT_VERB.UP,         "up",         [vk_up,    "W"],       [-gp_axislv, gp_padu]);
    InputDefineVerb(INPUT_VERB.DOWN,       "down",       [vk_down,  "S"],       [ gp_axislv, gp_padd]);
    InputDefineVerb(INPUT_VERB.LEFT,       "left",       [vk_left,  "A"],       [-gp_axislh, gp_padl]);
    InputDefineVerb(INPUT_VERB.RIGHT,      "right",      [vk_right, "D"],       [ gp_axislh, gp_padr]);
    InputDefineVerb(INPUT_VERB.ACCEPT,     "accept",     [vk_space, vk_enter],    gp_face1);
    InputDefineVerb(INPUT_VERB.CANCEL,     "cancel",      vk_backspace,           gp_face2);
    InputDefineVerb(INPUT_VERB.PAUSE,      "pause",       vk_escape,              gp_start);
	InputDefineVerb(INPUT_VERB.MAP,        "map",         vk_tab,                 gp_select);
    InputDefineVerb(INPUT_VERB.JUMP,       "jump",        vk_space,               gp_face1);
    InputDefineVerb(INPUT_VERB.ATTACK,     "attack",     [mb_left, vk_enter],     gp_face3);
    InputDefineVerb(INPUT_VERB.SUBWEAPON,  "subweapon",  [mb_right, vk_rshift],   gp_face2);
    InputDefineVerb(INPUT_VERB.DASH,       "dash",        vk_control,             gp_shoulderr);
    InputDefineVerb(INPUT_VERB.SWAP,       "swap",        "E",                    gp_face4);
    InputDefineVerb(INPUT_VERB.AIMLOCK,    "aimlock",     vk_lshift,              gp_shoulderl);
    
    //Define a cluster of verbs for moving around
    InputDefineCluster(INPUT_CLUSTER.NAVIGATION, INPUT_VERB.UP, INPUT_VERB.RIGHT, INPUT_VERB.DOWN, INPUT_VERB.LEFT);
}