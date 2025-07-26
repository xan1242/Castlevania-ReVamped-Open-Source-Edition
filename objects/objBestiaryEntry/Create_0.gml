/// @description setup
//global.enemy_entry = 0
//global.boss_entry = 0

entry_type = BestiaryEntryType.UNKNOWN
parentMenu = undefined
entry_hp = 0
entry_kills = 0
entry_number = 0
entry_pic = 0
entry_count = 0
entry_text = ""

scroll = 0
scrub = 0

//
// ENEMY DATA
//

bestiary_entries_enemy =
[
	"The walking corpses of previous uninvited guests, turned putrid and evil by their time in the haunted castle. Hoards of these undead  climb out of the ground and overwhelm intruders.",
	"An extremely rare curiosity, Dark Lord Dracula was astonished to find a leopard with this coloration during his travels. He immediately sought to tame and breed it, and, as such, the castle is now full of these little pets of his. Don't let their cute face fool you - these dark felines are just as dangerous as any normal leopard. Taking advantage of their dark fur, Black Leopards often wait in the darkness of tight spaces, to surprise and then charge their prey.",
	"A bat, cursed by the Dark Lord to suck the blood of any unfortunate passerby. They enjoy dark corridors and tend to hang out near the ceiling, but will attack quickly when provoked and pursue their prey.",
	"Creatures from the Black Lagoons of the Amazon, these humanoid fish monsters have taken residence in the deeper, wetter parts of Dracula's castle. Despite having the appearance of fish, these creatures are actually amphibious and attack with their fire-breath.",
	"A renowned warrior of Arthurian legend, the Black Knight is said to have bested Sir Calogrenant of the Round Table in single combat. He was reportedly later killed by Sir Yvain, but other stories indicate that he was actually killed by King Arthur while he was questing for the Holy Grail. Regardless of how he met his end, he was brought back from the depths of hell to serve as a guardian of Dracula's Castle.",
	"The children of the Gorgon Sister Medusa. Despite taking on the basic appearance of their mother, these floating heads do not have the ability to turn their prey to stone. Their movement is rather predictable, but they attack with force.",
	"The damned souls of those who wandered into Castlevania and met their end, leaving nothing behind but their regrets. They now float around the halls endlessly, lashing out at any living thing they may come across. ",
	"The reanimated heads of dragons that have their fire-breathing muscles still intact. Immoble, they defend areas as stationary canons, hence their name. They tend to use two fire attacks: a fireball that they can launch over long distances and a fire-breath that they use to incinerate closer targets. Despite often being in groups of two or more, each dragon is an individual entity and must, therefore, be destroyed on its own. Those who find themselves fighting these monsters would do well to keep their distance and find cover when at all possible. ",
	"A cursed collection of stained glass shards, brought together to form a sharp monstrosity. Despite its intimidating stature, this monster is still just glass.",
	"These unintelligent anomalies have no known origin. They come in many different colors, each moving at a different pace, and pounce on passersby indiscriminately. ",
	"A fleshy monster known and named for its unblinking eye. These creatures have been described in numerous ways, often including many eyes and a mouth, but those who call the castle home seem to only possess one eye. They use this eye to keep careful track of their targets and will rush those who are not careful.",
	"These finely carved statues were commissioned by the Dark Lord as ornaments for his castle. He later found ways to get demonic spirits to possess them, and now they act as guardians. They hide in their perches and swoop down on unsuspecting intruders.",
	"The remains of one of the many thousands of dragons that have been slain over the years. Dark Lord Dracula encountered the bones of many of these worm-like reptilians and has used his dark magic to reanimate them. Due to the incomplete nature of their skeleton, however, Skele-Dragon are stuck to one spot and cannot chase after their prey. Monster hunters should use this to their advantage as they watch out for their erratic movements and fire-breath.",
	"Unlike the standard ghosts that haunt the Castle, these spirits are ripped directly from hell and bring with them some of the hellfire. Seeking release from their eternal torment, Blazing Spirits attack passerby with a fiery viciousness. ",
	"Despite having the appearance of hunched over men, these are actually monstrous creatures summoned forth from the dark forests of the world. Having adapted to the tree-tops of their home, these creatures are extremely agile and will pounce on their target over and over until it is dead. As such, when facing these monsters, it is best to keep your distance.",
	"A simple, undead skeleton revived from the bones of past guests to the castle. Their bodies are cobbled together from many different bodies, and, therefore, often have extra bones, which they use as a projectile. Avoid these and move in close for a quick kill.",
	"Cursed birds that haunt the airy parts of the castle. These persistent attackers use their talons to deal damage as they swoop down on their prey over and over. ",
	"A collection of stones given life through unholy rituals. Rather than being possessed by a spirit, each individual rock is given life. When attacked, these monsters split into smaller versions of themselves to overwhelm their foes.",
	"A monstrous hound summoned from the depths of hell. These dogs are vicious, yet cautious. They will lie in wait in closed corridors and then rush out at their prey when they get close.",
	"A cursed skull that Dracula has given the powers of flight. He has also placed a portal inside of its mouth that allows it to vomit out a torrent of jagged bones from the crypts hidden in the castle.",
	"An absurdly large arachnid, kept as a favored pet by the Dark Lord. These creepy-crawlies use their webs and venom to overwhelm their prey.",
	"A lesser mummy pillaged from hidden tombs in Egypt. These mindless mummies have been reanimated with dark magic to haunt the halls of Castlevania. Their wraps have become loose with time, and they will throw these cursed scraps at their foes.",
	"A kind of violent mandrake made in the Dark Lord's torture lab. Using the fluids of his dying victims, Dracula sprouted these thornweeds as a trap for unwitting trespassers. Watch the floors carefully and eliminate these weeds quickly.",
	"These well-trained eagles assist the Hunchbacks, serving as support who carry in reinforcements. Watch the skies, as they have been known to drop Hunchbacks directly on top of their targets. ",
	"A poor widow who spent the remainder of her life staring at the wall. When she died, her spirit got stuck in the wall. She spends her afterlife jumping between surfaces to attack any who remind her of the joy she once had.",
	"The Swamp Thing was originally a person, who was murdered by a jealous friend. His body was dumped in the haunted swamps that surround Castlevania. Here, he became one with the swamp and now manages all the plantlife in the castle with his countless bodies.",
	"Water cursed with a perverted consecration. Rather than being blessed with the power to cleanse evil, this water has instead become evil and seeks to suck out the life of anything it can touch.",
	"A favorite pet of witches, these frogs are much larger than standard, and their tongue can deliver a sharp blow to any unfortunate targets.",
	"The haunted corpse of an unfortunate soul that drowned in the dark swamps around Castlevania. They sunk into the deep parts of the castle and prowl in the darkness. Their bodies have become so infused with the mud that they are very difficult to destroy.",
	"Another of the undead remains of previous ''guests'' to the castle. These skeletons were trained in the art of swordplay in life, and use those skills to lash out at intruders in their afterlife.",
	"Alas, poor Yorick! This poor man once served a great prince, raising him in the absence of the king. After his untimely passing, Yorick's head was removed and used as a memento of sorts. In his undeath, he has found it difficult to keep track of his head and often drops it on the floor, where he proceeds to inadvertently kick it around at alarming speeds. While he surely means no harm, his confused fumblings can prove as deadly as any other monster in the castle.",
	"A skeleton that the Dark Lord Dracula fused with the wings of a harpy. These chimeric undead can soar through the air and use their spears to skewer their enemies.",
	"Fallen angels who were corrupted by the fires of hell, these demons were sent forth by Lucifer to assist the Dark Lord in his conquest. Seeking vengeance for their fallen status, Lesser Demons lash out violently at mortals. They can take to the skies and attack their victims with their sharp talons. ",
	"An assortment of childhood toys for an unfortunate soul that grew up in the castle. While cute and playful with children, these creations become violent when they spot an intruder.",
	"A mirror with a very angry ghost trapped inside by one of Dracula's experiments. Despite being unable to leave the mirror, these vicious spirits still find ways to attack those foolish enough to walk by them.",
	"Jack O'Bones are skeletons that have been possessed by the mischievous spirit of Jack O'the Lantern. The bones that they throw will bounce around the room, tricking unsuspecting opponents. ",
	"A dark, violent creature that takes the appearance of a man without a head. Legends of this monster abound all across Europe, but one thing remains consistent: his appearance means death. He slays his unfortunate victims with deadly thrusts from his human-bone rapier.",
	"An enchanted set of golden armor tasked with patrolling the halls of Castlevania. Their spears give them the reach and power necessary to take down even well prepared foes. ",
	"Small, mischievous, and intelligent creatures that have been known to cause malfunctions of all kinds of machinery, including ships. Dracula appears to keep them as caretakers of the castle, though they will relentlessly attack anything or anyone that seems out of place. They are particularly aggressive tonight, as they have been fed well past midnight.",
	"These skeletons are the result of the Dark Lord's experiments where he attempted to summon the traitorous spirits from Cocytus. While he was unable to bring forth these spirits, he was able to trap some of the frozen wind of the Ninth Circle of hell. As such, these skeletons possess an icy composure, and will throw their bones with cold accuracy.",
	"Skeletons who have been unfortunately infused with gunpowder by the Dark Lord. These anxious monsters are known to charge their opponents before detonating.",
	"A skeleton that was reanimated using Dark Lord Dracula's own vampiric blood. This gives them special undead properties that prevent them from being destroyed, putting themselves back together shortly after falling apart. Monster hunters would do well to attack and then quickly get away from their bodies before they rise again.",
	"The undead remains of Holy Knights who sought to slay the Dark Lord in life. In death, they serve him as guardians of the castle, using their giant sword and superior strength to slay any intruders.",
	"A suit of heavy armor possessed by a powerful demon. Dracula has engineered this sentry to have a dangerous, boomerang-like axe that returns to its user after being thrown.",
	"Sometimes referred to as The Hat Man, Freddie is a demon known to intrude on people's dreams, often killing them in their sleep with his knife-fingers. He has been given a physical form by the Dark Lord, so that he may stalk the halls of the castle and defend it from intruders. ",
	"Ghosts who have been experimented on by the Dark Lord. Their slimy bodies possess the same incorporeal characteristics of normal ghosts, but with some added durability.",
	"A special species of rose bred by the Dark Lord Dracula to spit fire at anything that gets too close.",
	"A crow of unusual color. These birds are highly intelligent and territorial. They have been known to swoop down and attack passerby simply for coming too close.",
	"A spirit pulled fresh from hell and restored to their physical form. Despite being brought back to Earth, these unfortunate souls are not freed from their eternal torment and carry some hellfire with them. ",
	"The disgusting bird-women first encountered by the Ancient Greeks. Harpies' heads and bodies resemble that of a woman, but putrid and gray. Their arms and legs are those of birds, and they can fly as fast as eagles. They use their vicious talons to shred apart their prey. Many harpies now make their home in Castlevania and serve the Dark Lord as one of his many servants.",
];

bestiary_hp_enemy =
[
	1,
	3,
	3,
	4,
	16,
	1,
	16,
	24,
	64,
	1,
	8,
	32,
	40,
	20,
	1,
	8,
	1,
	32,
	9,
	1,
	9,
	20,
	1,
	1,
	1,
	16,
	1,
	12,
	80,
	17,
	20,
	1,
	32,
	1,
	10,
	8,
	1,
	50,
	1,
	8,
	45,
	666,
	17,
	60,
	30,
	24,
	50,
	1,
	32,
	1,
];

//
// BOSS DATA
//

bestiary_entries_boss =
[
	"The King of the Vampire Bats, who long ago was gifted the pure vampiric powers by the Dark Lord Dracula. These gave the Phantom Bat exceptional strength and intelligence. It has been a loyal servant of the Dark Lord ever since, and guards the entrance to his castle faithfully.",
	"The youngest and deadliest of the three Gorgon Sisters. Medusa was originally a beautiful maiden before being spurred by the Goddess Minerva for being violated within the Temple of Minerva. Medusa then became the monstrous woman with snakes for hair and a power to turn those who look upon her to stone. She was slayed by the hero Perseus in antiquity, but has been given new life by the Dark Lord Dracula. She has since lost her ability to turn her foes to stone, but fights with a fiery hatred of mortals, especially mortal men. She serves Dracula so that she may wreak her wrath upon the world once again.",
	"A strange creature supposedly given life through the incantations of a Rabbi Loew in Prague. While it was initially designed to protect the Jewish people in Prague, it went mad after Rabbi Loew failed to let it rest on the Sabbath. It then went on a murderous rampage, before finally being deactivated by Loew and crumbling to pieces. Dracula found these pieces, reassembled the golem, and gave it new life. Unfortunately, Dracula does not let it rest on the Sabbath, and so the Golem has become the dangerous, unstable guardian of the lower parts of the castle.",
	"These five mummies were once Egyptian Priests who served under Ramses II. They were found by Dark Lord Dracula during one of his expeditions to Egypt, and brought back to Castlevania. Being given new, immortal life by Dracula, these Priests now serve  and defend their new master and his castle.",
	"The unfortunate monstrosity created by Dr. Victor Frankenstein in his attempts to uncover the secrets of life. After being rejected by his creator and society as a whole, Frankenstein's monster was cursed to wander. The Dark Lord found him huddled in a cave in the frozen arctic. Dracula promised him a home, and so the Monster defends his newfound family with his life.",
	"An Elven Trickster who was cursed to roam the mirror dimension for his misdeeds and take the shape of any who cross its path. The Mirror Monster was found by Dracula, who used his dark magic to allow the Mirror Monster to temporarily escape its prison in exchange for his service. It now haunts the mirrors of the castle, eagerly awaiting a chance to break free and confront any intruders.",
	"A cursed group of unfortunate souls, forced together meaninglessly in the depths of hell by the devil. They now bear this unholy and torturous shape, lashing out at all living things. This entity was given to Dracula as a gift by Satan as part of their pact to destroy the world. Granfalloon acts as yet another one of Dracula’s generals in his hellish army.",
	"A member of the Great Old Ones that once ruled the earth, Cthulhu was found by Dracula, sleeping in an ancient city beneath the ocean. While worshiped as a god by many cults, Cthulhu has not yet regained his full strength. He allies himself with Dracula so that he may regain his powers, and assist in taking back the world while he waits.",
	"The physical manifestation of Death brought forth to assist the Dark Lord in his evil conquest. He was sent by Lucifer himself as part of a pact with Dracula to help conquer the world and cover it in darkness. The Grim Reaper provided Dracula with much of the knowledge used to raise his army, and currently serves as a general and final guardian to the Dark Lord.",
	"The Dark Lord and Master of Castlevania, Vlad Dracula Tepes. Originally known as ''Vlad the Impaler,'' Dracula became a vampire early in his life and used his abilities to torture the peasents in his land and experiment with evil magics. He fell in love with a woman, but she was ripped away from him and burnt as a witch. He has sworn vengeance ever since and has created a pact with the Devil himself to take over the world. While he was stopped in the past, he is cursed by his pact with the Devil to return again and again, every one-hundred years until his work is complete.",
];

bestiary_hp_boss =
[

	200,
	500,
	200,
	270,
	370,
	500,
	500,
	500,
	500,
	666,
];

function setUnknownGeneric()
{
	entry_name = "????"
	entry_text = "------"
	entry_hp = "???"
	entry_kills = 0
}

function setUnknownEnemyEntry()
{
	setUnknownGeneric();
	entry_pic = 50
}

function setUnknownBossEntry()
{
	setUnknownGeneric();
	entry_pic = 10
}

function onEnemyScroll(entry_num)
{
	scroll = 0
	entry_number = entry_num
	
	if (!is_enemy_entry_unlocked(entry_num))
	{
		setUnknownEnemyEntry();
		return;
	}
	
	entry_name = get_enemy_name(entry_num, true)
	entry_text = bestiary_entries_enemy[entry_num]
	entry_hp = bestiary_hp_enemy[entry_num]
	entry_kills = ds_map_find_value(global.savedata,"bestiary" + string(entry_num))
	entry_pic = entry_num
}

function onBossScroll(entry_num)
{
	scroll = 0
	entry_number = entry_num
	
	if (!is_boss_entry_unlocked(entry_num))
	{
		setUnknownBossEntry();
		return;
	}
	
	entry_name = get_boss_name(entry_num, true)
	entry_text = bestiary_entries_boss[entry_num]
	entry_hp = bestiary_hp_boss[entry_num]
	entry_kills = ds_map_find_value(global.savedata,"bestiary_boss" + string(entry_num))
	entry_pic = entry_num
}

function hideMenu()
{
	bitsound(sndPickupHeart)
	visible = false
	if (parentMenu != undefined)
	{
		parentMenu.visible = true
		parentMenu.setSelected(entry_number)
		instance_activate_object(parentMenu)
	}
}

function showMenu()
{
	bitsound(sndPickupHeart)
	deactivate()
	
	if (parentMenu != undefined)
		parentMenu.visible = false
	visible = true
}
