#!/usr/bin/lua

local random_scheme = [[
 1#  R-1.1  N-1.1 |  R-2.1  o-2.1 |  R-3.1  L-3.1
 2#  R-4.1  N-4.1 |  R-5.1  o-5.1 |  R-6.1  L-6.1 |  R-1.2  L-1.2
 3#  R-2.2  N-2.2 |  R-3.2  o-3.1 |  R-4.2  L-4.2 |  R-5.2  N-5.2 |  R-6.2  o-6.2
 4#  R-1.3  o-1.3 |  R-2.3  L-2.3 |  R-3.3  N-3.3
 5#  R-4.3  o-4.3 |  R-5.3  L-5.3 |  R-6.3  N-6.3 |  R-1.4  N-1.4
 6#  R-2.4  o-2.4 |  R-3.4  L-3.4 |  R-4.4  N-4.4 |  R-5.4  o-5.4 |  R-6.4  L-6.4
 7#  R-1.5  L-1.5 |  R-2.5  N-2.5 |  R-3.5  o-3.5
 8#  R-4.5  L-4.5 |  R-5.5  N-5.5 |  R-6.5  o-6.5 |  R-1.6  o-1.6
 9#  R-2.6  L-2.6 |  R-3.6  N-3.6 |  R-4.6  o-4.6 |  R-5.6  L-5.6 |  R-6.6  N-6.6
10#  R-1.1  o-1.1 |  R-2.1  L-2.1 |  R-3.1  N-3.1
11#  R-4.1  o-4.1 |  R-5.1  L-5.1 |  R-6.1  N-6.1 |  R-1.2  N-1.2
12#  R-2.2  o-2.2 |  R-3.2  L-3.1 |  R-4.2  N-4.2 |  R-5.2  o-5.2 |  R-6.2  L-6.2
13#  R-1.3  L-1.3 |  R-2.3  N-2.3 |  R-3.3  o-3.3
14#  R-4.3  L-4.3 |  R-5.3  N-5.3 |  R-6.3  o-6.3 |  R-1.4  o-1.4
15#  R-2.4  L-2.4 |  R-3.4  N-3.4 |  R-4.4  o-4.4 |  R-5.4  L-5.4 |  R-6.4  N-6.4
16#  R-1.5  N-1.5 |  R-2.5  o-2.5 |  R-3.5  L-3.5
17#  R-4.5  N-4.5 |  R-5.5  o-5.5 |  R-6.5  L-6.5 |  R-1.6  L-1.6
18#  R-2.6  N-2.6 |  R-3.6  o-3.6 |  R-4.6  L-4.6 |  R-5.6  N-5.6 |  R-6.6  o-6.6
19#  R-1.1  L-1.1 |  R-2.1  N-2.1 |  R-3.1  o-3.1
20#  R-4.1  L-4.1 |  R-5.1  N-5.1 |  R-6.1  o-6.1 |  R-1.2  o-1.2
21#  R-2.2  L-2.2 |  R-3.2  N-3.1 |  R-4.2  o-4.2 |  R-5.2  L-5.2 |  R-6.2  N-6.2
22#  R-1.3  N-1.3 |  R-2.3  o-2.3 |  R-3.3  L-3.3
23#  R-4.3  N-4.3 |  R-5.3  o-5.3 |  R-6.3  L-6.3 |  R-1.4  L-1.4
24#  R-2.4  N-2.4 |  R-3.4  o-3.4 |  R-4.4  L-4.4 |  R-5.4  N-5.4 |  R-6.4  o-6.4
25#  R-1.5  o-1.5 |  R-2.5  L-2.5 |  R-3.5  N-3.5
26#  R-4.5  o-4.5 |  R-5.5  L-5.5 |  R-6.5  N-6.5 |  R-1.6  N-1.6
27#  R-2.6  o-2.6 |  R-3.6  L-3.6 |  R-4.6  N-4.6 |  R-5.6  o-5.6 |  R-6.6  L-6.6
]]

local name = {}
local playset = {}

name[1+#name] = 'borderlands'
playset[1+#playset] = [[
Relationships
1 Romance
1 Love across species
2 Unrequited love
3 Mated pair
4 Both after the same man / woman
5 “You killed my lover”
6 Former lovers
2 Family
1 Parent and child
2 Clan patriarch/matriarch and descendant
3 Siblings
4 Adopted into the tribe
5 Black sheep of the family
6 You think you’re related, but you aren’t
3 Warfare
1 Brothers in arms
2 “You killed my brother”
3 Powerful warrior and oppressed lackey
4 One killed the paladin, one got the credit
5 Brutish mercenary and employer
6 Tactician and savage berserker
4 Vile Sorcery
1 Shaman and apprentice
2 Were friends before one died and came back as an undead
3 Both enchanted with a terrible curse
4 Necromancer and toady
5 High Priest of Zemox and heretic
6 Doppelganger and the person being impersonated
5 Survival
1 Scavengers from rival tribes
2 Basilisk herders
3 Hunting dragons together
4 Made a terrible bargain for their own survival
5 Deserters from the big battle
6 Fungus farmers
6 Tribal
1 Outcasts from the tribe
2 Deposed chieftain and usurper
3 Aging goblin king and heir
4 Spies for rival tribes
5 “You tribe has been stealing our food”
6 One tribe pays fealty to the other
Needs
1 To Get Revenge
1 On the humans of Restwell Keep
2 On the lying kobold on the other side of the valley
3 On the Mad Hermit of the Wood
4 By ruining a black magic ceremony
5 By starting a war with the lizardmen of the swamp
6 By letting a horrible monster loose
2 To Get Glory
1 By defeating the wizard of Restwell Keep
2 By leading the orc warriors in battle
3 By outwitting the minotaur of the caves
4 By completing the ritual of human sacrifice
5 By stealing an enchanted sword
6 By lying about what you did
3 To get rich
1 By looting Restwell Keep
2 By stealing from the orc tribe next door
3 By robbing the temple of Zemox
4 So you can afford the magic ritual
5 By finding lost treasure
6 By opening a legitimate place of business
4 To get out
1 Of the dungeons of Restwell Keep
2 Of the Caves of Chaos
3 Of a debt that you owe
4 Of the medusa’s clutches
5 Before they uncover your lies
6 And become leader of your own tribe
5 To get the truth
1 By kidnapping the Baron of Restwell Keep
2 About the location of the buried treasure
3 About the curse on this magic wand
4 About the high priest of Zemox
5 About the medusa’s secret weakness
6 Before it’s too late
6 To get laid
1 By the human priestess in Restwell Keep
2 Because that’s where half-orcs come from
3 By the strongest warrior in the valley
4 To remove this terrible curse
5 To continue on the royal bloodline
6 And become the Kobold Queen’s consort
Location
1 Restwell keep
1 The Baron’s bedchamber
2 Locked in the dungeons
3 The jewel merchant’s storeoom
4 The hidden shrine to Zemox
5 The Stumbling Giant tavern
6 The Wizard’s Guildhouse
2 The Border forest
1 The village of those stupid elves
2 The Mad Hermit’s hut
3 The web of a giant spider
4 The sacred grove of the druids
5 A bandit’s camp
6 The largest tree in the world
3 The Caves of Chaos
1 The kobold warrens
2 The minotaur’s labyrinth
3 The edge of a bottomless pit
4 The goblin’s supply room
5 The mushroom farm
6 Where two chiefs meet in secret
4 The Church of Zemox the Bloody
1 The Treasure Chamber
2 The Black Priest’s personal chambers
3 The Innermost Sanctum
4 The Altar of Peril
5 Inside the Secret Passage
6 The Cursed Pool
5 The Broken Cliffs
1 Where a Dwarvish mine come to the surface
2 The hippogriff’s nest
3 Wedged between two boulders
4 Where the stone men gather
5 Hanging from a tree branch
6 The lookout’s post
6 by the Crooked river
1 Underneath the King’s Bridge
2 Where you dumped the body
3 The burrow of a dire weasel
4 Where dead men walk
5 The swamps where the lizardmen dwell
6 The wreckage of a crashed riverboat
Object
1 Valuables
1 The crown of the Baron of the Western Lands
2 A diamond the size of a plover’s egg
3 A lewd statue of the human’s Goddess of Chastity
4 The jewel encrusted skull of a necromancer
5 Two dragon eggs: one red and one gold
6 A chest full of electrum coins
2 Information
1 A map of the secret entrance to Restwell Keep
2 The diaries of the Mad Hermit
3 Notes on how to disarm the traps in the caves
4 The defaced holy book of the human’s goddess
5 A dying orc’s last confession
6 The secret codeword to pass the checkpoint
3 Animals
1 A sorcerer’s weasel familiar
2 A rabid owlbear
3 A specially trained chicken
4 A pig resurrected as a zombie
5 A gelatinous cube blocked in a dead end cave
6 A mated pair of basilisks
4 Magic
1 A sorcerer’s stolen spellbook
2 An enchanted mirror
3 A helm of telepathy
4 Instructions to a dark ritual
5 The Black Priest’s magic armor
6 An intelligent talking sword
5 Weapons
1 A fallen paladin’s longsword
2 A stolen greataxe
3 The jawbone of a dinosaur
4 A cursed spear
5 A malfunctioning catapult
6 The Elf King’s Golden Bow
6 Traps
1 A hobgoblin ambush just down the corridor
2 A rug stretched across a hidden pit
3 A cave-in waiting to be triggered
4 An magically animated crossbow turret
5 A boulder suspended on top of a cliff
6 A mummified medusa’s head hidden by a curtain
]]

name[1+#name] = 'hellmouth_high'
playset[1+#playset] = [[
Relationships
1 Friends
1 BFFs since grade school
2 Transfer student and angsty loner, friends by default
3 Afterschool study buddies
4 Detention regulars
5 Guy and platonic gal pal
6 In a band
2 Freaks
1 Burger Town coworkers
2 Future Farmers of America
3 Drama club superstars
4 Hellmouth High’s only out gay couple
5 Amateur paranormal investigators
6 Fifth-year student and volunteer tutor
3 Geeks
1 Science fair partners
2 Computer club president and treasurer
3 Dungeon master and player
4 Sole members of the school chess club
5 Yearbook photographer and editor
6 Valedictorian top runners
4 Social Set
1 Muscle-car owner and girlfriend-of-the-week
2 Jerk jock and bench warmer
3 Alpha bitch and minion
4 Cheerleading captain and tryout
5 Fashion victim and frumpy protegee
6 Homecoming queen rivals
5 Suspicious
1 Inveterate nerd and improbably perfect girlfriend
2 Rising football star and “nutritional supplement” dealer
3 Pair of weird outcasts
4 Former loser now oddly popular and the friend left behind
5 Good kid running with a bad crowd and concerned sibling
6 Eerily charismatic exchange student and love-struck admirer
6 Supernatural
1 Werewolf and the one friend who knows
2 Teen diabolist and hated classmate
3 Slayer and spunky sidekick
4 Vampire and thrall
5 Volatile psychic and bully ringleader
6 Undercover demon and clueless minion
Needs
1 To get into
1 The Hellmouth High cheerleading squad
2 A decent college
3 The principal’s office unseen
4 Chad Russell’s backseat
5 The popular crowd
6 Courtney Atherton’s pants
2 To get out of
1 Detention
2 An afterschool job at Burger Town
3 The principal’s office
4 This basement alive
5 Your obligations
6 This terrible curse
3 To get even
1 At the homecoming dance
2 With that bitch Courtney Atherton
3 With this whole damn school
4 With the principal
5 By occult means
6 By humiliating Chad Russell
4 To get through
1 A single night at Old Man Henderson’s
2 AP Calculus
3 This utter social disaster
4 The pending undead apocalypse
5 An awful homecoming date
6 To a friend on a downward spiral
5 To get the truth
1 About what they’re serving in the school cafeteria
2 About the disappearances
3 About what’s hiding in the school basement
4 About the faculty
5 About the accident
6 About the new principal
6 To get away
1 From whatever is hunting you
2 With murder
3 From your demons, metaphorical or real
4 With Chad Russell for the weekend
5 From school grounds without getting caught
6 With a villainous scheme
Locations
1 Town
1 The Pit, local nightclub notoriously lax about checking ID
2 Burger Town
3 Crystal Cavern Occult Supply
4 Santa Muerte State Beach
5 Russell house in upscale Hellmouth Heights
6 Batcave Games and Comics
2 School
1 Principal’s office
2 Computer lab
3 School library with its odd collection of rare occult tomes
4 Well-stocked science lab
5 Locker room
6 Auditorium
3 Field Trip
1 On the bus
2 Tribal art exhibit
3 Tide pools
4 Archeological dig
5 Local zoo
6 Observatory
4 Extracurricular
1 Homecoming dance
2 District science fair
3 Graduation
4 School darkroom
5 Cheerleading tryouts
6 End zone at the big game
5 Sordid
1 Subterranean punk squat
2 Beneath the bleachers
3 Closet in the facult lounge
4 Empty house while the parents are away
5 Back alley behind The Pit
6 Hellmouth Bluff, local make-out spot
6 Spooky
1 Dilapidated crypt
2 Old Man Henderson’s place
3 Strangely labyrinthine school basement
4 Nearby woods after dark
5 Burger Town freezer
6 Sewer tunnels
Objects
1 Dangerous
1 Arsenal of crossbows and hand weapons
2 Fireman’s axe, in case of emergency
3 Gas-powered chainsaw
4 Cache of silvered bullets
5 Ancient sword, preternaturally sharp
6 Demonic invocation, written in blood
2 Mysterious
1 Lunchlady casserole special
2 Creepy tribal artifact
3 Top-secret FFA breeding project
4 Rejected science fair submission
5 Dead tentacled creature washed up on shore
6 Burger Town secret blend
3 Old
1 Improbably old door, arcanely sealed
2 Ancient grimoire in proto-Sumerian
3 Severed hand, dried and preserved
4 Old Man Henderson’s desiccated corpse
5 Collection of near-mint Silver Age comics
6 Dusty tome of apocalyptic prophecies
4 Illicit
1 Administrative password to school records
2 Forged parent’s note
3 Performance enhancing drugs of dubious origin
4 Counterfeit hall pass
5 Stolen coroner’s report
6 Cache of cheap liquor
5 Odd
1 Man-sized cage and metal restraints
2 Crude poppet with a lock of stolen hair
3 Elaborate home chemistry kit
4 Exsanguinated body stuffed in a locker
5 Black altar stained with blood
6 Journal filled with crazed ramblings
6 Cool
1 Chad Russell’s sweet ride
2 Designer homecoming dress
3 Extra ticket to a sold-out show at The Pit
4 Invite to an exclusive party
5 Final cheerleading cut list
6 Dad’s borrowed car keys
]]

name[1+#name] = 'eclipse_phiasco'
playset[1+#playset] = [[
Relationships
1 Transhumanism
1 Primary and fork / backup
2 Created consciousness and programmer
3 Scientist and subject
4 Uplift and uplifter
5 Psychosurgeon and patient
6 Infomorph refugees
2 Factions
1 Jovian spy and the one who knows
2 Anarchist troublemakers
3 Hyperelite and obsessive fan
4 Experienced exhuman and novice
5 Hypercorp “company men”
6 Old gatecrashing buddies
3 the fall
1 Betrayer and betrayed
2 Savior and saved
3 Brothers-in-arms
4 Members of opposed nation-states
5 Exsurgent and the one who knows
6 Debt-slave and credit holder
4 Crime
1 Scum kingpin and unstable lackey
2 Rival hackers
3 Ego hunter and mark
4 Pandora gate smugglers
5 Petal dealer and junkie
6 Researchers of forbidden knowledge
5 Habitat
1 Outer system loners
2 Jovian zelots
3 Rival scum-freighter crews
4 Old simulspace buddies
5 Exoplanet colonists
6 Barsoomian hillbillies
6 Edited memories
1 Misplaced memories / their current owner
2 Mutually mysterious past
3 Con artist and mem-edited mark
4 Love of their life and the one who forgot
5 Hypercorp agents with deleted secrets
6 Metacelebrity / personality manager
Needs
1 To survive
1 Being surrounded by your enemies
2 The latest breakup
3 That ego hunter who just won’t quit
4 The latest wave of layoffs
5 The consequences of doing what’s right
6 The discovery of that alpha fork you lost track of
2 To discover
1 Why you woke up in this morph
2 The real reason s/he’s here
3 ecologene’s top secret project
4 The contents of the data-cache implant in your abdomen
5 If love can bloom in the cold, dark void
6 How best to get back at them
3 To profit
1 At a rival’s expense
2 From privileged information
3 So you can pay for your sibling’s morph
4 From a well-told lie
5 From the work of your own hands (or tentacles)
6 From what they’re making you do
4 To escape
1 The looming conspiracy
2 The doldrums of immortality
3 Into an actual flesh and blood body
4 The ever watching eye of your ex
5 From someone who knows the truth about you
6 Indentured servitude
5 To reclaim
1 Lost rep
2 Your old morph
3 Something from Old Earth
4 Some semblance of dignity
5 Something worth living for
6 A destroyed relationship
6 To destroy
1 An inhuman monstrosity
2 Every point of that bastard’s rep, everywhere, with everyone
3 Every shred of evidence against you
4 Your philosophical rivals
5 Your faction ties
6 Their life’s work
Locations
1 Corporate
1 Bioconservative protest line
2 Ecologene Smart-Pet™ outlet #491-M
3 The TRANSFORMER dance club
4 Ego backup / resleeving facility
5 Public nanofabricator / general store
6 Psychosurgery clinic
2 Underworld
1 Petal den
2 Black market augmentation clinic
3 Biochauvinist terrorist hideout
4 T.Q.Z. smuggling tunnels
5 Joe’s Secondhand Morphs (No refunds!)
6 Pleasure Pod Brothel
3 Scientific
1 Subterranean cryogenics bay
2 Xenofloral greenhouse
3 Ecologene R&D
4 Fusion power plant
5 AGI growth server facility
6 Martian Pandora Gate
4 The mesh
1 VR-Game server
2 0Chan.msh
3 Bioconservative blogging collective
4 Anonymous VR chatspace
5 Ecologene complaints site
6 Shady VPN
5 Wilderness
1 Ecologene CustomAnimal Safari™
2 Terraforming worksite
3 TITAN Quarantine Zone (T.Q.Z.)
4 Backwoods solar-power farm
5 Barsoomian caravan hab
6 Hinterland wilderness campsite
6 Orbit
1 Hollowed-out asteroid habitat
2 Space elevator
3 Ecologene Orbital H.Q.
4 Visiting scum barge
5 Lu Xing Space Meat Research Station
6 Derelict Freighter
Objects
1 Firepower
1 Flesh eating nanomachines
2 Over-the-horizon sniper rifle
3 Reaper morph
4 Orbital kill-sat
5 Antimatter hand grenade
6 Microwave agonizer
2 Contraband
1 Alien artifact
2 Secure flash drive with 50 petabytes of narcoalgorithms
3 A dozen griefer morphs
4 Kidnapped metacelebrity
5 Ecologene’s latest biotech breakthrough
6 Morph DRM removal kit 0.8
3 Ego
1 Watts-McLeod infection
2 Infomorph in a ghostrider module
3 Undisclosed psychiatric glitch
4 Sleeved into an ill-suited morph
5 Low level fork sidekick
6 Lifelong memory cache
4 Spywork
1 Breadcrumb nanotracker
2 Syringe of mind-altering serum
3 T-Ray emitter and view goggles
4 Chameleon cloak
5 Slither bot
6 Quantum codebreaking computer
5 Common transhumanity
1 Necklace with a genuine USA dime
2 Nanofabricator
3 Utilitool
4 Unhelpful muse AI
5 Expensive organic sculpture
6 Adorable Smart-Pet companion
6 Information
1 Hostile safehouse location
2 The name of the best lay on the planet
3 Undeniable proof of the conspiracy
4 That asshole’s mesh ID
5 The mesh address of the Ecologene email servers
6 Blackmail datacache password
]]

name[1+#name] = 'fiasco_of_jurassic_proportions'
playset[1+#playset] = [[
Relationships
1 Keepers
1 Trainer and assistant
2 Game warden and veterinarian
3 Herbivore handler and Jeep driver
4 Tour guides
5 Lab technicians
6 Pooper scooper and assistant
2 Business folk
1 Public relations manager and influencer
2 Park owner and blood-sucking lawyer
3 Security specialist and ex-Marine hired guard
4 Park founder and heir to the family business
5 Head of operations and personal assistant
6 Park Warden and Chief veterinarian
3 Experts
1 Paleo-partners (Paleontologist/Paleobotanist)
2 Geneticist and skeptical scientist
3 Dino expert and child who knows an unrealistic amount about dinos
4 Paleontologist and enthusiastic graduate student
5 Field photographer and animal behavioral scientist
6 Chaos theorist and ethologist (studies animal behavior)
4 Park goers
1 Pre-teen siblings
2 Rich family on vacation
3 Grandparent/ grandchild
4 Honeymooners
5 Won a contest/ plus one
6 Travel blogger
5 Illicit
1 Mercenaries
2 Corporate spy and ambitious scientist
3 Animal rights activists
4 Animal smugglers
5 Big game hunter and second-in-command
6 Betrayed by the same person
6 The past
1 Were present at the last Jurassic Park catastrophe
2 Studied archeology together
3 Used to be friends, but had a difference of opinion about dino rights
4 Ex-lovers
5 Both fired from Jurassic World
6 Estranged siblings
Needs
1 To get in
1 To the employee’s only section
2 The good graces of the park’s eccentric founder
3 And see a dinosaur hatching
4 And liberate the goats
5 The pants of the attractive paleo scientist
6 On the next big dinosaur attraction.
2 To reveal the truth
1 About what’s really going on in that research facility
2 About whether the triceratops was real or not
3 About what happened in 1993 on Isla Nublar.
4 About what happened in San Diego when the T-rex got loose
5 About what these dinosaurs are being bred for
6 About how Jurassic Park keeps getting reopened
3 To get revenge
1 On John Hammond
2 On those greedy exploitive bastards
3 For your uncle who died unloading a velociraptor
4 On the shady military group and their shady plans
5 For what happened a decade ago
6 By any means necessary
4 To finally
1 See that damned T-rex everyone’s talking about.
2 Prove to your family that dinosaurs are cool
3 Get a grant that will fund your research
4 Develop the perfect dinosaur hybrid
5 Convince the public that dinosaurs deserve protection
6 Name a dinosaur after yourself
5 To get rich
1 By selling dino parts on the black market.
2 By obtaining company stock by any means possible
3 By trading company secrets
4 By auctioning off live dinosaurs
5 By impressing the investors
6 To clear your debt with InGen
6 To get control
1 Of your very own dinosaur and take it home
2 Of the park’s security when all this goes to shit
3 Of an animal that keeps trying to escape
4 Of the rowdy visitors
5 Of the park’s falling profits
6 Before you make a fool of yourself
Locations
1 Isla nublar
1 The Visitor Center
2 Docks
3 Maintenance Shed
4 An industrial kitchen
5 John Hammond Creation Lab
6 Helipad
2 Isla sorna
1 A field of long grass
2 T-rex nest
3 Geothermal power plant
4 High hide (40 feet off the ground in the tree canopy)
5 Derelict InGen laboratory
6 Worker Village
3 Dangerous terrain
1 The base of an active volcano
2 A secret hybrid research facility
3 A tropical hurricane
4 A precarious cliff
5 An unfinished, abandoned section of the park
6 An electrified fence
4 Park attractions
1 Baby dino petting zoo
2 “Bone Shaker” roller coaster
3 Innovation Center
4 Jungle River Cruise
5 Mosasaurus Feeding Show
6 Gallimimus Valley Tour
5 Paddocks and enclosures
1 T-rex paddock
2 Velociraptor containment unit
3 Dilophosaurus paddock
4 Pteranodon Aviary
5 Herbivore Grove
6 Goat farm
6 Emergency services
1 Communications Center
2 Emergency Shelter
3 ACU Center
4 Infirmary
5 Ranger Station
6 Armory
Objects
1 Technology
1 Night-vision goggles (they’re heavy which means they’re expensive)
2 A 1993 high tech computer (it’s a unix system!)
3 Satellite Phone (complete with Kirby Paint and Tile ringtone)
4 Dinosaur tracking chip
5 A “faultless” security system
6 Head mounted raptor cameras
2 Dino Bits and Pieces
1 Dino DNA stored in a Barbasol can
2 Velociraptor eggs
3 A 3d printed model of the resonating chamber of a dinosaur
4 A be aker full of t-rex urine
5 A literal ton of dino feces
6 A mosquito trapped in amber
3 Weapons
1 SPAS-12 shotgun
2 Cattle prod
3 Lindstradt tranquilizer gun
4 A fossilized raptor claw
5 Flare gun
6 A well-trained velociraptor
4 Vehicles
1 A fully licensed Jurassic Park Jeep (on rails!)
2 A Gyrosphere
3 Triumph Scrambler Motorcycle
4 InGen Jeep Wrangler (with extendable side car)
5 A saddled triceratops
6 RV Mobile Command Center
5 Lost and found
1 A “Dino-Soar” parachute pack
2 A few bolas
3 A Mr. DNA lunchbox
4 A lucky backpack
5 A camera with incriminating photos
6 A replica T-rex tooth model
6 Nature
1 Recently-hatched dinosaur eggs
2 Foreboding ripples / shaking ground
3 Wounded or sick dinosaur
4 An “empty” paddock
5 Dino kibble
6 A tasty goat
]]

name[1+#name] = 'goblin_uprising'
playset[1+#playset] = [[
Relationships
1 Blood
1 Brood-twins
2 Brood-kin
3 Matron / Whelp
4 Sire / Whelp
5 Pureblood / Half-demon
6 Pureblood / Half-human
2 Professions
1 Axe-grinders
2 Bone-pickers
3 Rat Farmers
4 What passes for goblin diplomacy
5 Tinkerers
6 Rival Artists
3 Clan
1 Raiding Leader / Bumbling Scout
2 Mad Shaman / Reckless Apprentice
3 Goblin Overseer / Monstrously Large Goblin
4 Chief / Matron
5 Headhunter / Traitor
6 Tyrant / Activist Leader
4 Raiding
1 Used to be in a band together
2 Rival spider riders
3 Raiding leader / Prisoner of war
4 Bonesetter / patient
5 Only survivors of a botched raid
6 Goblin sappers
5 Cults
1 Rat Whisperer Cultists
2 Shroom Tenders Cultists
3 Sludge Keepers Cultists
4 Forbidden worshippers of the human gods
5 Worshippers of the great Gorlaxythak, Demon of Petty Vengeance
6 Goblin Labour Union Local 166
6 Romance
1 Hopeless romantic / heartless manipulator
2 Paired for political power
3 Paired because of prophesy
4 Jealous rivals
5 Keeping love in the family
6 Goblin divorce is rare for a reason....
Needs
1 To Steal
1 Enough rats for the winter
2 The human siege engine
3 The dwarven forge
4 The halfling pipeweed harvest
5 A heart through devious seduction
6 Their hearts for dark rituals
2 To destroy
1 The local barracks
2 The village militia
3 The elven village
4 The leader of the holy order
5 The archmage’s ritual protections
6 The dragon from the east
3 To Get Away
1 With the goblin treasury
2 Before the heroes arrive
3 Before they realize who you really work for
4 With a murder that matters
5 With the love of your life
6 With strange heresy
4 To Ally with...
1 A brood of oozes and jellies
2 A multi-eyed abomination in love
3 A scheming band of dark elves
4 The things from outside reality
5 A human kingdom in civil war
6 A dragon with unusual ambitions
5 To get Petty Vengeance
1 For a promise broken
2 For a trinket stolen
3 For a rumour spread
4 For a truth revealed
5 For a vision denied
6 For stealing all the credit
6 To Rule
1 The rival goblin tribe
2 A new tribe of your own
3 The halfling village
4 By marrying into royalty
5 A mercenary company
6 Everything
Locations
1 Home
1 The Vermin Stables
2 The Feeding Hall
3 The Bone Pit
4 The trapped tunnels
5 The shaman’s grotto
6 The Chief’s treasury
2 It’s a Trap!
1 The Rival Kobold Hive
2 Campsite occupied by a band a human adventurers
3 Temple of the Demon God
4 Arcane Library
5 Grimtooth’s Unreliable Deathtrap
6 The Dragon’s Lair
3 The Human Fortress
1 The Catacombs
2 The Scum and Villainy Tavern
3 Kordhelm military outpost
4 Lord Trammel’s Keep
5 The Temple of Everlasting Peace
6 The War Wizard’s Academy
4 The Halfling Village
1 The Hobford corn maze
2 A hops plantation, minimally guarded
3 Lomlet mushroom farm
4 The Stout Semolina Bakery
5 The Ironbone mine
6 The Bazaar of the Bizarre
5 That Ugly Green Forest
1 The Dryad’s Glen
2 The Web-filled Morkwood Forest
3 The charred remains of an ancient forest
4 The Twitching Woods
5 The wood elf camp, filled with flowers.
6 The sleeping giant hills
6 Wonderful Wetlands
1 The breeding mud pit
2 Abandoned mine with a dark secret
3 The sludge grotto
4 The ghost marsh
5 The leech-filled fishing hole
6 The toxic cesspool
Object
1 Pointy Sticks
1 A half-melted iron fire poker
2 A wizard’s staff with a knob at the end
3 A spear coated in glowing ichor
4 A large skewer of rats
5 The broken banner stand of the lost army
6 The cursed sword of the demon king
2 Goblin Ritual Magics
1 Torog’s Uncontrollable Explosive Flatulence
2 The Discipline of Kleptomancy; divination via theft
3 The Ritual of Reincarnation
4 Vermin Swarm Sorcery
5 Summoning Random Planar Beings
6 Goblins shouldn’t throw fireballs
3 Spoils of War
1 A slightly damaged pipe organ
2 A massive pile of exotic art
3 The contents of an herbalist’s shop
4 An entire village’s livestock
5 A wagon load of costumes being sent to the bardic college
6 A mountain of miscellaneous, mundane books
4 Abandoned by Adventurers
1 The Crown of fearlessness, slightly dented
2 The map of the human city
3 A cask of 800-year-old dwarven booze, half-filled
4 A bag of holding, filled with strange tools
5 A deck of countless things
6 A dozen unlabeled potions
5 Weapons
1 Poisoned dagger (dirk of vicious viper’s venom)
2 Gnomish repeater crossbow (X-35 automatic projectile launcher)
3 Experimental goblin enhancement potions
4 Stolen Human catapult
5 An enchanted flame whip
6 500lbs of explosives and unreliable fusing
6 Captives and Food Stores
1 A self-righteous paladin, abandoned by her friends
2 A trade merchant, seeking to make a deal
3 A noble child with a bizarre magical talent
4 A Cave Troll, slave since birth
5 A dwarven priest, evangelical and persuasive
6 A demon, strangely obedient
]]

name[1+#name] = 'science_comics'
playset[1+#playset] = [[
Relationships
1 Family
1 Brother and sister
2 You think you aren’t related, but you are
3 Parent and illegitimate child
4 Took in and adopted an orphan child
5 Close enough that you might as well be related
6 Clones
2 Social
1 Neighbors
2 Old college pals
3 Bowling rivals
4 Small time drug peddler and client
5 “He’s renting out my spare room for a while”
6 Journalist and inside source
3 Romance
1 Ex-husband and ex-wife
2 She wants him, he doesn’t want her.
3 She left him for another man
4 Kicked out of the military on a Don’t Ask Don’t Tell beef
5 Had a one night stand, long ago
6 Both are after the same woman
4 Heroes
1 Smart sidekick to a dumb hero
2 Old has-been and his number one fan
3 Hunted vampires together back in the seventies
4 Hero and his arch-enemy
5 Rival superscientists
6 Bodyguard and the guy you’re guarding
5 Villains
1 Similarly themed villains both fighting for use of the same name
2 Villain and the innocent caught in my evil plan
1 Supervillain and bureaucrat from the Global League of Villainous Enterprises
4 Supervillain team-up!
5 “Curse your sudden but inevitable betrayal!”
6 Both trying to kill the same hero
6 Minions
1 Villain and number two henchman
2 Two henchmen assigned to the same task
3 “He’s covering for me while I’m busy”
4 New recruit and old hand
5 Just assigned here by the henchmen temp agency
6 Taskmaster and cowardly minion
Needs
1 To get even
1 Before your debt comes due
2 With the lousy Captain Victory for what he did to you
3 With Undercover Girl for exposing your secret
4 With the whole damn world
5 With the Global League of Villainous Enterprises, for kicking you out
6 With your old college roommate
2 To get laid
1 By an honest to goodness superhero
2 To prove that you still got it
3 By a sexy green skinned extraterrestrial
4 And finally prove your love
5 To prove that you’re better than him
6 To get at what you really want
3 To get rich
1 By robbing banks, taking hostages and the usual villain stuff
2 By holding the entire United Nations hostage
3 By passing off someone else’s work as your own
4 So you can finally retire
5 By working as a gunman for hire
6 Because you desperately need the money for the operation
4 To get the truth
1 About who your parents really are
2 By impersonating a major name villain
3 About the true goals of the Global League of Villainous Enterprises
4 About The Ladybug’s true identity
5 About what happens at midnight mass at the Cathedral of St.Drogo
6 About who has been embezzling from the henchmen’s weekly lottery pool
5 To get respect
1 By killing the indestructible Captain Victory
2 From your mother, who said that you’d never amount to anything
3 From the kids that laughed at you back at Don Winslow High School
4 From the bureaucrats at the Global League of Villainous Enterprises who classified you as a ‘D’ class villain
5 By stealing what was said to be unstealable
6 From the Mole People that live under New York City
6 To get out
1 Of a legally binding merchandising contract
2 Of this disastrous blind date
3 Of this maximum security supervillain prison
4 Before the Global League of Villainous Enterprises discovers your unsanctioned use of a Class 11 Doomsday Device
5 Of an uncomfortable social obligation
6 Before your carefully constructed lies fall apart
Objects
1 Doomsday devices
1 The Zero Time detonator
2 A nuclear device bought on the black market from some Serbians
3 A Saturninan Planetary-scale Gravitic Negater
4 Dr. Thunder’s weather control device
5 Suleiman’s Iron Sphere, wherein are trapped hundreds of deadly
6 A single vial labelled “extremely deadly nerve toxin”
2 Tawdry
1 A baggie of cocaine stuffed inside a child’s teddy bear
2 The photographs from Dr. Plasma’s bachelor party
3 Both sets of financial records for the Wonder League’s merchandising company
4 Lightning Girl’s sex tape
5 A forged license to operate as a costumed hero
6 The severed hand of The Purple Claw
3 Sentimental
1 Your massive Captain Victory comic book collection
2 Your old bass guitar from your high school band
3 The only photo of your real mother
4 The phone number of the last woman you slept with
5 The Congressional Medal of Honor
6 Your old outfit from when you were a big shot
4 Valuable
1 Blueprints to a secret project
2 Two ounces of Unobtanium, the rarest chemical compound in the universe
3 The alchemical formula for turning lead into gold
4 A mysterious mechanical device, built by ancient scholars, of unknown purpose
5 The deed to the Daedalus 2 geosynchronous space station
6 The stolen contents of a bank safety deposit box
5 Superscience
1 A malfunctioning shrink ray
2 A really stupid artificial intelligence
3 A prototype laser melee weapon that the military rejected (“They said they don’t do much hand to hand fighting any more.”)
4 A tabletop cold fusion reactor
5 Truth serum with unknown, potentially dangerous side effects
6 The Memory Erasing Tank
6 Vehicles
1 A broken down hoverbike
2 An experimental supersonic jet
3 A jet propelled submersible
4 The Amazing Rocket Hat
5 The family minivan
6 An old muscle car, retrofitted with all the superspy gadgets
Locations
1 In the Arizona Desert
1 The Air Force testing facility at Groom Lake
2 A rundown trailer park
3 The vast private estates of a deceased superscientist
4 The edge of a smoking crater
5 A long forgotten fallout shelter deep beneath the earth
6 A seedy strip club (is there any other kind?)
2 Downtown New York City
1 Offices in a towering skyscraper
2 The United Nations
3 Times Square
4 Atop the Statue of Liberty
5 In an abandoned subway station
6 A dingy, cockroach ridden hotel room
3 The suburbs
1 A planned community for supervillains
2 Laundrytown, your one stop for 24 hour self serve cleanliness
3 Your friendly neighborhood strip mall
4 A pep rally at Don Winslow High School (Go Crocs!)
5 Teapot Dome Regional Hospital
6 An estate auction for a deceased superscientist
4 Foreign parts
1 Tijuana, baby
2 The deepest, darkest parts of the Amazon rainforest
3 A scientific research station on Antarctica
4 An ancient castle in Bavaria
5 An Asian nation mysteriously not on any map
6 At a rave in Stockholm
5 Exotic locales
1 Onboard a pirate ship, out at sea
2 Onboard Daedalus 2, a geosynchronous space station
3 A volcanic island shaped like your head
4 On the astral plane
5 A gateway that opens on an alternate reality
6 Ten thousand years in the future, accessible via time portal
6 Intimate
1 In a 15 year old girl’s bedroom
2 Inside my own subconscious
3 Trapped in an elevator together
4 Inside Dr. Plasma’s back pocket
5 The confessional booth at the Cathedral of St. Drogo
6 The Honeymoon Suite at the Hotel of Love
]]

name[1+#name] = 'skagway_valley_real_estate'
playset[1+#playset] = [[
Relationships
1 Professional
1 Agent and suspicious, armed seller
2 Agent and contractor
3 Agent and nervous buyer
4 Mentor and rookie
5 Agent and home inspector
6 Agent and pest control
2 PErsonal
1 Members of the “Keep Skagway Valley Clean” committee
2 Parent and adult child
3 One night stand
4 The one who got away, and the one who couldn’t let go
5 High school friends
6 Siblings
3 Buyers and Renters
1 Newlyweds looking for first home
2 Film crew, scouting the perfect location
3 Recent graduates
4 College kids
5 Undercover agents, investigating a cold case
6 First time house-flippers
4 Sellers
1 A couple facing foreclosure
2 A couple in the middle of a nasty divorce
3 Serviceman and spouse, heading to next posting
4 Bank agents, desperate to be rid of this property
5 Siblings, selling parents’ house
6 Older couple, downsizing
5 Rivals
1 Buyer’s Agent vs Seller’s Agent
2 Agents from competing companies
3 Golden child and the one written out of the will
4 Frenemies
5 For the “Agent of the Year” award
6 In love
6 Legal
1 Agent and eviction cop
2 One got the house and one got the contents
3 You both got half the house
4 Trustee and beneficiary
5 You didn’t know the other existed until the old geezer died
6 A restraining order was filed at some point
Locations
1 Haunted
1 Cemetery on premises
2 Resident poltergeist
3 Former mortuary and funeral parlor
4 Creepy child’s laughter in attic
5 Built on an Indian burial ground
6 They never found the body
2 crime
1 Murder in the kitchen
2 Suicide in the bathroom
3 Belonged to a mob boss before he was finally busted
4 Cult den
5 Former meth lab, condemned by city
6 Tunnel to maximum security prison under the shed
3 Problematic
1 My gods, they’ve painted everything black
2 Something is living in the backyard
3 Crazy Cat Lady’s house
4 Riddled with asbestos, and no one else knows
5 Extreme damage from last tenant (spray paint, feces, broken walls)
6 The Money Pit (unfinished, will take $$$ work to complete)
4 bad Neighborhood
1 Noisy sex neighbors
2 Single family home in a college neighborhood
3 Hundred foot wall built on either side by cranky millionaire (who owns both sides)
4 Right next door to doomsday cult
5 Crazy domestic disturbances next door
6 The neighbor feeds all 100 feral neighborhood cats in their driveway
5 strange
1 Castle, moved brick-by-brick from Eastern Europe
2 Derelict church, being converted to a home
3 Former site of hippie commune
4 Doomsday bunker in back yard
5 Old farm, site of numerous alien abductions and occasional crop circles
6 Sits above vast underground complex
6 fame and Misfortune
1 Ex porn studio
2 It’s on the historic buildings registry
3 Famous movie house
4 Attracts nosy tourists
5 Eccentric millionaire’s mystery mansion
6 Famous horror author’s house
Objects
1 legal
1 Eviction notice
2 Last Will & Testament
3 Title to a property
4 Deed to the mansion
5 Incriminating evidence
6 Affidavit, forbidding sale
2 trouble
1 Dead body in the compost heap
2 Weapons cache in the attic
3 Basement converted to sex dungeon
4 Armed squatter, holed up in a cardboard fort in the living room
5 Marijuana crop in greenhouse
6 Video footage, caught on the home security system
3 wealth
1 Gold buried in the backyard
2 $5 million worth of solid silver bars stashed in the garage
3 Papers showing that the house was built by a famous architect
4 Walls lined with stolen cash
5 A sealed vault, hidden in the master bedroom
6 “Do you have any idea how much this land is worth now?”
4 keys
1 Key to a hidden safe
2 “Do you have any idea what this key is for”?
3 Keys to the property
4 Key to a safe deposit box
5 Key to the attic
6 Key to the shed
5 something lost
1 Proof of Ownership
2 An old diary
3 Copper wire and pipes throughout the house
4 The former owner’s pet python
5 A wedding ring
6 Keys to the handcuffs
6 something found
1 Strange tracks in the backyard
2 An odd smell coming from under the floorboards
3 Two tons of explosives hidden in the drywall
4 A cryptic note
5 A map drawn on the inside of a closet door
6 A yellowed photograph, tucked between two loose boards
Needs
1 to Buy
1 A house with lots of “potential”
2 Any place, so long as it has six bedrooms
3 Some shit hole that you can trash
4 Back your childhood home
5 Someplace isolated. You have your reasons.
6 This place before they realize what it’s worth
2 To Sell
1 Before the market crashes
2 And get out of town. Fast.
3 A real lemon
4 And make an easy buck off of these idiots
5 Your story
6 A huge lie
3 To Get Away
1 With murder
2 With the ritual slaughter of goats inside city limits
3 With busting someone outside of your jurisdiction
4 From your crazy ex
5 With insurance fraud
6 With the security deposit
4 To Get Even
1 With the landlord
2 With that bastard from Sunny Homes Real Estate
3 With the next door neighbors
4 With your family
5 With someone for cheating you out of $100K
6 With your so-called “friends”
5 To Get Out
1 Of a horrible lease
2 Of a dangerous situation
3 Of this town before it drives you crazy
4 Of a bad relationship
5 Of debt, by any means necessary
6 Of a promise (or contract)
6 To Make it Big
1 And start your own real estate agency
2 Somewhere far from here
3 At Skagway Valley Real Estate Agency
4 Before your creditors come knocking
5 Before they find out you were lying
6 Before your high school reunion
]]

name[1+#name] = 'southern_fried'
playset[1+#playset] = [[
Relationships
1 Friends
1 Thick as thieves
2 Guy/gal next door
3 Childhood BFFs turned frenemies
4 Part of your bingo group or bible study
5 Drinking buddies
6 Former cellmates
2 Kin
1 Mama’s boy / overbearing mother OR spouse of mama’s boy /overbearing mother-in-law
2 Just barely legal / underaged sibling
3 Yer mama (or yer daddy)
4 Kissin’ cousins
5 Country bumpkin turned city kid / relative left behind
6 Not blood relations but everyone calls them Auntie or Uncle
3 Lovers
1 Sweethearts
2 Twitterpated / clueless
3 Teenage dirtbag / pastor’s kid
4 Separated spouses (not legally divorced yet)
5 Married for decades
6 In the closet
4 Foes
1 Sheriff / outlaw
2 Local football star / rival quarterback
3 Families embroiled in a centuries-old blood feud
4 Stole yer girl or guy
5 Stole yer livelihood
6 Got someone you love locked up or killed
5 Associates
1 Partners in law
2 Partners in crime
3 Crime boss / lackey
4 Manager / waitress
5 Lawyer / client
6 Dealer / drug addict
6 Townsfolk
1 They live just down the road a piece
2 Bartender / frequent patron
3 Mayor / constituent
4 Underpaid teacher / student
5 New in town (not from around these parts)
6 Local minister / overzealous church lady
Needs
1 To get rich
1 By selling goods that aren’t exactly legal
2 By taking what’s rightfully yours
3 Through cleverness and hard work
4 By good old-fashioned burglary/larceny/petty theft
5 To get the hell out of this backwoods nowhere
6 By makin’ it big-time
2 To fulfill your duty
1 Even though you’re dreading it
2 By providing for your family
3 Because it’s the law
4 And restore your family’s honor
5 Because it’s the patriotic thing to do
6 Because no one else will
3 To find love
1 Or at least marry rich
2 Because you have too many damn kids to do this alone
3 Or at least get hitched before you/your lover start looking pregnant
4 Because everything else is worthless
5 Now that you’re no longer incarcerated
6 With someone who understands you
4 To get revenge
1 It’s best served cold and calculated
2 Because it’s time for this to end
3 And finally break the family curse
4 Because you really were innocent
5 Because you made a promise
6 Because everyone’s against you
5 To get away
1 Because your life depends on it
2 By laying low for a while
3 Because you want out of the business
4 From the po-po
5 From being the object of an unrequited crush
6 And get edjacated
6 To get answers
1 About where you come from
2 About where the family fortune is buried
3 About who really gets what now that they’re finally dead
4 From someone who owes them to you
5 And expose this whole town for what it really is
6 Or die trying
Locations
1 The hills
1 The old Abernathy mine
2 A secluded farm, nothing to see here
3 Tent city / laborer’s camp
4 An abandoned oil well
5 A dirt road just past the “No Trespassing” sign
6 An isolated hillbilly community: stay away, they ain’t right
2 The woods
1 Favorite fishing spot
2 Bonfire site
3 Abandoned cabin
4 Makeshift shooting range
5 The rope swing on Traver’s Pond
6 Rumored voodoo doctor’s place of business
3 Downtown
1 The Piggly Wiggly
2 Moxley High football field
3 Nail salon or barber shop
4 Town hall
5 Town jail
6 Post office
4 Longstreet
1 Moxley First Baptist Church
2 Longstreet Cemetery
3 Statue of Stonewall Jackson
4 Longstreet Savings & Loan
5 Belle’s Blue Orchid (honky-tonk bar)
6 Old Dixie Gun Shop
5 Down the road
1 The Stuck Pig (beer and barbecue)
2 Ma ‘n Pa’s Corner Store
3 Moxley Junkyard
4 The only mechanic in town
5 A perfectly innocent warehouse
6 The neighbor’s front yard
6 The big city
1 Annual County Fair
2 Courthouse
3 Hooters
4 Sports stadium
5 The biggest Walmart you ever did see
6 Amusement park
Objects
1 Needs
1 A fake arm
2 A pack of smokes
3 Outdated gaming console
4 Hair extensions
5 A cooler, not sure it’s empty though
6 An antique casserole dish
2 Weapons
1 Broken beer bottle
2 Shotgun
3 A genuine Confederate bayonet
4 High school football trophy
5 Brass knuckles
6 Dynamite
3 Duds
1 Leather vest
2 Official NASCAR jacket
3 Daisy Dukes
4 Head-to-toe camo
5 Coveralls
6 Muddy work boots
4 Contraband
1 A duffel bag filled with cash
2 A ziplock bag with a suspicious-looking substance
3 A stash of weapons
4 A bag of funny cigarettes
5 Expensive jewelry gained through questionable means
6 A crate of moonshine
5 Transportation
1 Mine cart
2 1969 Dodge Charger
3 Four wheeler
4 Fishing boat
5 Fifth-wheel
6 A car on blocks in the front yard
6 Revelations
1 An old letter found under the floorboards
2 A long lost will
3 A hidden safe
4 Photos you weren’t supposed to see
5 A heartfelt verbal confession at an inconvenient time
6 A bible with a faded inscription or family tree
]]

name[1+#name] = 'toontown_noir'
playset[1+#playset] = [[
Relationships
1. Around Town
1. In the business & trying to get into the business
2. Grew up in a rough neighborhood together
3. That fateful night in Hollywoodland
4. New in town & born-’n’-raised
5. Cop & contact
6. Regulars at the Ink & Paint Club
2. Love
1. Love on the rocks
2. The odd (yet perfect) couple
3. “So beautiful! I have to have him/her/it”
4. Just one night! Give me just one night!
5. “I’ll kill that patty-caking S.O.B!”
6. It would never work out. But it would be so hot...
3. Family & Friends
1. Quarreling family
2. Friends from before The War
3. S/he’s like family
4. S/he was your best friend until...
5. The only family you have left
6. Stepchild and stepparent that are too close in age
4. Rivals
1. For the same job
2. Waning star & waxing star
3. For the same lover
4. ...Off-screen, bosom buddies on-screen
5. For control
6. For the last laugh
5. In Toontown
1. Toon & human, out of their element
2. Hero & serial villain
3. Spent too long on the other side
4. Creator & creation
5. Adult human & their childhood favorite
6. Overworked animator & “big mistake”
6. Shady
1. Kinda good cop, very bad cop
2. “I know an Animator with loose morals.”
3. “I don’t have the keys to these handcuffs!”
4. The Big Cheese’s minion & local hero
5. Informant & informed upon
6. You & me versus the world
Needs
1. To get rich
1. At anyone’s expense
2. Using this fool-proof scheme
3. And/or rule the world!
4. In friends. Well, allies... You’d settle for not enemies.
5. And get out of this crazy business
6. So you can pay off your debts before they get you!
2. To get out of this town...
1. Before the law catches up with you
2. Without anyone checking the trunk of your car
3. Before Big Cheese catches up with you
4. On vacation before anyone else tries to talk turkey
5. By morning
6. Before they find out it was all your fault
3. To get back
1. That briefcase before your boss notices
2. Your self-respect
3. Your sense of humor
4. Your mojo
5. What was taken from you
6. Into their good graces
4. To get out
1. Of Toontown
2. Of this relationship with your sanity
3. Of this mistaken identity mixup
4. Of Big Cheese’s gang
5. Of this awful job
6. Of this 2-year binge
5. To get revenge...
1. On the one(s) who stole your glory
2. On your crazy creator
3. On your ex-lover
4. On those bastards at The Studio
5. For that deal they ruined
6. On everyone who laughed at you
6. To
1. Catch that wascally whatever
2. Get famous by any means necessary
3. Get in good with the Big Cheese
4. Make a big splash, but keep your nose clean
5. Win back your “true love”
6. Have the last laugh
Locations
1. Toontown
1. Cafe L’Ooney on an Old World Europe style street
2. The laboratory of the Mad Dr. Brainzer
3. Creepy Castle
4. The land of talking animals
5. Toontown City Hall
6. The Acme factory
2. Hollywoodland
1. A bustling outdoor market
2. Lake Hollywood Reservoir
3. The WORST green room
4. A secluded overlook on Mulholland Highway
5. The Studio’s executive offices
6. The editing room floor
3. The wrong side of the tracks
1. The banks of the Los Angeles River
2. Roadside Motel off the 101 Highway
3. Underground toon fight club
4. Your nemesis’s secret hideout
5. A seedy hole-in-the-wall called Jim’s Place
6. The Trainyard
4. The upper crust
1. A deluxe suite at the Chateau Marmont
2. La Dolce Vita Ristorante
3. Greystone Mansion in Beverly Hills
4. Coco Bongo, a glitzy nightclub
5. Uncle Moneybags’ estate
6. Rodeo Drive, Beverly Hills
5. Tourist attractions
1. La Brea Tar Pits
2. The Magic Castle
3. Hollywood Boulevard (Hollywood Walk of Fame)
4. Santa Monica Pier
5. Griffith Observatory
6. Grauman’s Chinese Theatre
6. Off the beaten path
1. Loading docks at the Safeway market
2. Sound Stage 36
3. Funny Business, all-toon revue
4. ?
5. Local 728 Union Hall (Electrical Lighting Technicians)
6. Hollywood Masonic Temple
Objects
1. Seemingly Innocuous
1. An old, much-handled photograph
2. Pencil with a nice eraser
3. Ring of keys
4. An itemized receipt, slightly crumpled
5. Shooting schedule for that hot new movie
6. A fifth of cheap bourbon
2. From the Acme catalog
1. A portable hole
2. A gallon of glue
3. Rocket shoes
4. Disappearing reappearing ink
5. A box exploding cigars
6. Jetpack
3. Dangerous
1. A well-maintained Colt .45
2. Barrel of Dip
3. Toonifier
4. Sledgehammer Sam’s phone number
5. Anvil
6. The Big Cheese’s girlfriend
4. From Toon Town
1. A cartoon pistol
2. Benny, the cab
3. The Sorcerer’s magic hat
4. A real live MacGuffin!
5. THE Last Laugh
6. A widdle yellow canawy
5. Coveted
1. Last will & testament
2. Final draft of that hot new screenplay
3. The location of Taylor Pendleton
4. A one-of-a-kind sculpture
5. A strange green mask
6. Hastily scribbled name and phone number
6. Suspicious
1. A Dictaphone tape hidden in a houseplant
2. Is that blood or red paint?
3. Empty pair of boots with smoke coming out
4. Non-human footprints at the scene of the crime
5. An underground railroad into/out of Toontown
6. Two supposed enemies seen whispering together
]]

name[1+#name] = 'way_out_west'
playset[1+#playset] = [[
Relationships
1 family
1 Parent/ son- or daughter-in-law
2 Twins
3 Third Cousins
4 Great Grandparent/ great grandchild
5 Unrelated, but close as blood
6 Somehow related, but the family tree looks more like a bush
2 The past
1 Grew up a stone’s throw from each other
2 Dropped out of the 3rd grade together
3 Fought in the War of 1812 together
4 Bad family blood
5 Dreamed of opening a butcher shop together
6 Families lived in a commune
3 Acquaintances
1 Traveling salesman/ customer
2 Drinking buddies
3 Fellow passersbys that share more than they know
4 Always wave at each other, but never spoken
5 Suffragettes
6 Met at a family reunion
4 Community
1 Went to the same church
2 Swapped peach pie recipes back home
3 Volunteers (church, government, law enforcement)
4 Members of a prestigious club (Gentlemen's, Women's, etc.)
5 Freemasons
6 Pillars of the community
5 Romance
1 Kissin' Cousins
2 Muscled Ruffian/ bookworm virgin
3 Mail order bride/ groom
4 Former spouses
5 Former lovers
6 Bored in a wagon, looking for some excitement
6 Fiends
1 Violent family blood
2 Shared a property-line fence that became a contention
3 Both pursuing the same love interest
4 Outlaws
5 Competitors in illegal trades (opium, morphine, etc.)
6 Actively trying to convert each other
Needs
1 To get rich
1 Because there's gold in "them there hills!"
2 By exploiting the efforts of others
3 By swindling others with your diluted water miracle elixirs
4 To pay off a $150 debt
5 Through a cache of bonds and silver coins
6 Through robbing a stagecoach
2 To get away
1 From clingy family members
2 With murder
3 From a sizeable debt you owe to the government
4 From your second spouse and kids
5 From bounty hunters hot on your trail
6 From your shameful past
3 To finally
1 Make something of yourself
2 Prove to your in-laws that you are an adult
3 Beat the Calloways at something by settling West first
4 Own a plot of land
5 Settle down and have a family
6 Extend your family tree beyond the inbred mutants
4 To get laid
1 Because kissin' your third cousin ain't illegal out west.
2 Because that's what people in love do
3 To further your superior bloodline
4 So you don't die a virgin
5 By that cute girl with the bonnet who keeps flashing you her ankles
6 Because what else is there to do?
5 To get even
1 With the Natives who stole your girl
2 With the Calloways who always seem to one-up you
3 With the government
4 With a family member
5 With that damned wagon salesman
6 With whoever gets in your way
6 To establish
1 A new parish for your denomination
2 A "healthy" relationship with the locals
3 A colony with blackjack and hookers
4 A trading post
5 Votes for women
6 Your reputation
Locations
1 Towns/forts
1 Fort Laramie, Wyoming
2 Fort Bridger, Wyoming
3 The Dalles, Oregon
4 Old Man Jenkin's Supply Emporium
5 Fort Walla Walla, Washington
6 Independence, Missouri
2 Historical
1 The Sierra Nevadas
2 The Mormon Trail (Illinois, Iowa, Nebraska, Wyoming, Utah)
3 Chimney Rock, Nebraska
4 Independence Rock, Wyoming
5 Courthouse Rock, Nebraska
6 Donner Pass, California
3 Wilderness
1 A little house on the prairie
2 A field of poison oak
3 A buffalo stampede
4 A cult of wilderness fanatics
5 A trading post run by Indians
6 Stinky Pete's Outhouse
4 Bodies of water
1 Soda Springs, Idaho
2 Kansas River
3 An upside-down wagon near the Platte River, Nebraska
4 Cripple Creek, Colorado
5 Snake River, Idaho
6 Obediah Smith's manmade watering hole
5 Out and about
1 The remains of a burned wagon, a reminder that we are doomed
2 A sweatlodge
3 Maddog Buford's wagon
4 Inside a bear cave
5 A trailside cemetery
6 An old mine shaft
6 Dangerous terrain
1 A snowstorM
2 Unending heat and exhaustion
3 A barren desert with nothing to eat or drink
4 A mysterious fog
5 An overflowing river
6 Steep cliffs and pointy rocks
Objects
1 Trail treasures
1 A basket of questionably fresh picked produce
2 A bloody pocket watch
3 A chest at the bottom of a 6 foot deep, 6 foot wide hole
4 A cursed horseshoe
5 Discarded wagon parts and various animal parts
6 Buffalo chips
2 Oddities and outfits
1 A coonskin hat with a secret compartment
2 A replica Davy Crockett vest and trousers
3 A cask of unmarked tombstones
4 A bearskin costume
5 Used long johns
6 Ceremonial peace pipe
3 Camp clutter
1 Your lucky canteen
2 A harmonica that attracts wild animals
3 Chamber pot
4 Salted meat and pickles
5 A poker deck with 5 aces
6 A mangy mutt
4 Family heirloom
1 Your great great great grandfather's pickaxe
2 The deed to 1/64th of an acre of fertile land
3 Grandpappy's ashes
4 A locket with something important inside
5 A bible
6 An embroidered handkerchief
5 Weapons
1 Grandpappy's Navy Revolver
2 A gunslinger's belt and enough ammo to cause a species extinction
3 A crate of dynamite labeled "Fragile"
4 A Sioux war club
5 A flaming pitchfork
6 A two foot bayonet
6 Varied valuables
1 A blind ox
2 All-natural remedies (heroin, morphine, etc.)
3 A set of Russian nesting dolls
4 Snake bite antidote
5 A half burnt map of the trail
6 A compass that only points south east
]]

name[1+#name] = 'zombie_apocalypse'
playset[1+#playset] = [[
Relationships
1 Family
1 Parent in law and son/daughter in law
2 Cousins, or aunt/uncle and niece/nephew
3 Siblings
4 Parent and (step/adopted) child
5 Grandparent and grandchild
6 Distant, weird, or practically family
2 Life Before
1 White collar co workers
2 Boss and minimum wage slave
3 Brothers in blue
4 Criminal and customer (drug dealer, loan shark, hacker)
5 Ex- con and law enforcement (parole o cer, cop)
6 Doctor and patient
3 Friends
1 Manipulator / victim
2 Old pals
3 Post- apocalypse pals
4 Friendly rivals
5 Friends with bene ts
6 We hated each other Before, but everything s di erent now 
4 Romance
1 Former spouses
2 Current spouses
3 Lifelong crush/lust and object
4 One- time ing
5 Lovers After
6 Lovers Before
5 Life After
1 Co leaders of the pack
2 Leader and upstart rival
3 Lowest pair in the pecking order
4 Isolationist and explorer
5 Scientists looking for answers
6 Damaged goods and protector
6 Strays and Newcomers
1 Black marketeer and scrounger
2 Prophet and unbeliever
3 Con artist and dupe
4 Last survivors from a di erent group
5 Passing through on their way somewhere else
6 Envoys from the other survivor camp
Needs
1 To get out
1 Of this camp, before they nd out what you did
2 Of this mall, which is a total death trap
3 Of the deal you made before you knew what they were like
4 Of this relationship, which makes no sense in the After
5 Of your moral obligation to that other survivor
6 Of the country, to a safe island
2 To get even
1 With a rival who wronged you
2 With the zombies, for what they made you become
3 With the leader of your pack
4 With the other survivor camp
5 In a way you couldn t in the Before
6 With the bad people, who think they re so tough
3 To live another day
1 Before anyone nds out about the zombie bite
2 By leveraging the horde of canned goods
3 By nding a safer place to sleep
4 With your missing family members
5 With the burden of starting the plague
6 By selling out the suckers who trust you
4 To get respect
1 From the other survivor camp, by proving your group is just as tough
2 From your fellow survivors, by nding the next place to camp
3 From your lover, by protecting them 
4 From the leader of the pack, by unmasking the hoarder
5 From the jocks/nerds, because now they actually matter
6 From yourself, by facing that secret fear
5 To uncover the truth
1 About how the Before turned into the After
2 About the leader of the pack s real motivations
3 About what happened last night outside the doors
4 About what lies fty miles down I- 80
5 About what goes on inside the Temple 
6 About the mistake that haunts you
6 To get laid
1 For the rst time
2 Because hate sex is great sex
3 To further your scheme
4 Because humanity must go on
5 By anyone, just to forget for a while
6 By your sweetheart, who s acting funny
Locations
1 The wild
1 An isolated cabin with a clearing around it
2 The wide open entrance to a missile silo
3 A desolate stretch of highway
4 A pond with murky depths
5 The edge of the cli overlooking the ruined skyline
6 A prison set far apart from the nearby towns
2 The city
1 The top of the Peerless Tower, tallest building in town
2 The City Plaza entrance to the sewer system
3 The local CDC o ces
4 The Army Navy Surplus Store
5 The middle of the Smithson Footbridge 
6 The Whole Foods supermarket
3 The mall
1 The sporting goods store
2 The corridor behind the food court
3 The roof, between the air conditioning units
4 The shattered glass doors at the main entrance
5 The dead fountain in the dead center
6 The CVS pharmacy
4 The encampment
1 The armory
2 The locked room now called the Temple 
3 The sniper perch with a good view of everything
4 The leader s room, apart from the rest
5 That awed place in the defenses that people don t like to think about
6 The bunk beds with no privacy at all
5 Hospital
1 The room where they keep the drugs
2 The morgue
3 The cafeteria
4 The parking garage, with ambulances
5 The security o ce
6 The fallout shelter, locked from the inside
6 The other survivor camp
1 The entrance, heavily guarded
2 The room where they test people for infection
3 The working solar shower
4 The radio room with some working gear
5 The food store, full of canned goods
6 The secret escape route, accessible from both directions
Objects
1 Zombies
1 The one who bit someone
2 The one you loved Before
3 The one that can speak like a human
4 The one you hated Before
5 The one who started it all
6 The one who hasn t attacked anyone yet
2 Transportation
1 A high speed Stingray cabin cruiser
2 A heavily damaged Hummer 
3 An illegally modi ed Nissan 370Z
4 An 18 wheeler with an empty trailer
5 A pair of Honda motorcycles
6 A Beechcraft Bonanza, ready to y
3 Weapons
1 A golf club
2 A Husqvarna chainsaw
3 A string of claymore mines
4 One ampule of deadly virus
5 A sword someone made in the After
6 A .45 revolver
4 Information
1 A road atlas with a couple of pages missing 
2 An overheard conversation
3 A CD ROM without a label
4 The results of the most recent blood test
5 A Red Cross First Aid Handbook
6 A brochure listing all the hunting stores in the area
5 Valuables
1 The last box of ammo
2 Crate of MREs
3 A handful of condoms
4 Matched pair of walkie talkies
5 One ampule of counteragent for the infection
6 Shortwave radio
6 Sentimental
1 A newborn child
2 The last picture of a loved one
3 The knife you saved a life with
4 Wedding ring
5 A cassette tape with their voice still on it
6 Medals from the war
]]

local relation, need, object, location = 1,2,3,4

local scenarios = {}
local s
for L in random_scheme:gmatch("[^\n\r]*") do
  local found = false
  s = {players = {}}
  L = L:gsub('^[^#]*#[ \t]*','')
  for P in L:gmatch('[^|]*') do
    local p = {}
    s.players[1+#s.players] = p
    P = P:gsub('^[ \t]*',''):gsub('[ \t]*$','')
    for I in P:gmatch('[^ \t]+') do
      local kin, sec, itm = I:match('([^-]*)%-([^.]*)%.(.*)')
      sec, itm = tonumber(sec), tonumber(itm)
      if "R" == kin then p.relation_section, p.relation_item = sec, itm end
      if "N" == kin then p.detail_kind, p.detail_section, p.detail_item = need, sec, itm end
      if "o" == kin then p.detail_kind, p.detail_section, p.detail_item = object, sec, itm end
      if "L" == kin then p.detail_kind, p.detail_section, p.detail_item = location, sec, itm end
      found = true
    end
  end
  if found then
    scenarios[1+#scenarios] = s
  end
end

for k, title in ipairs(name) do

print('\n>>>>>>>>>>>>>', title)

local fiasco_playset_data = playset[k]
fiasco_playset_data = ('\n' .. fiasco_playset_data):gsub('\n[\n\r0-9 \t]*', '\n')

local fiasco_playset = {}

local item_per_section = 6
local section_count, sub_section_count, item_count = 0, item_per_section, item_per_section
local section_name, sub_section_name = '', ''

local count = 0;
for item in fiasco_playset_data:gmatch('[^\n]*') do
  if item and item ~= '' then
    count = count + 1
    item_count = item_count + 1
    if item_per_section < item_count then
      sub_section_count = sub_section_count + 1
      item_count = 0
    end
    if item_per_section < sub_section_count then
      section_count = section_count + 1
      sub_section_count = 1
      item_count = -1
    end
    if -1 == item_count then
      section_name = item
    end
    if 0 == item_count then
      sub_section_name = item
    end
    local sectab = fiasco_playset[section_count]
    if not sectab then
      sectab = {}
      fiasco_playset[section_count] = sectab
    end
    local store = sectab[sub_section_count]
    if not store then
      store = {}
      sectab[sub_section_count] = store
    end
    if 1 <= item_count and item_per_section >= item_count then
      local s = section_name:gsub('%.',''):gsub('s$','')
      store[1+#store] =  '__' .. s .. '__ ' .. sub_section_name:gsub('%.','') .. ' - ' .. item
      -- store[1+#store] = (({Relationship='R',Object="o",toontown_noirNeed="N",Location="L"})[s]) .. '-' .. section_count .. '.' .. sub_section_count
      -- print('debug',section_count,#store,store[#store])
    end
  end
end

local scen = 0
local function nextscenario()
  scen = scen + 1
  -- do return '\n'..tonumber(scen) end
  return '\n### Scenario '..tonumber(scen)..'\n'
end

math.randomseed(0)
local function randomname(pl)
  return "- Player "..tostring(pl) .. '\n'
  -- if pl == 1 then return '#' else return ' |' end
  -- local names = {'Barbara', 'Charles', 'David', 'Elizabeth', 'James', 'Jennifer', 'Jessica', 'John', 'Joseph', 'Karen', 'Linda', 'Mary', 'Michael', 'Patricia', 'Richard', 'Robert', 'Sarah', 'Susan', 'Thomas', 'William', }
  -- local surnm = {'Smith', 'Jones', 'Taylor', 'Brown', 'Williams', 'Wilson', 'Johnson', 'Davies', 'Patel', 'Robinson', 'Wright', 'Thompson', 'Evans', 'Walker', 'White', 'Roberts', 'Green', 'Hall', 'Thomas', 'Clarke', }
  -- return names[math.random(#names)]..' '..surnm[math.random(#surnm)]..'\n'
end

local function playitem(it)
  -- return '  ' .. it
  return '  - ' .. it .. '\n'
end

local P = fiasco_playset

if 6 ~= #(P[relation]) then error('not enough relation kind') end
if 6 ~= #(P[relation][1]) then error('not enough relations of kind 1') end
if 6 ~= #(P[relation][2]) then error('not enough relations of kind 1') end
if 6 ~= #(P[relation][3]) then error('not enough relations of kind 1') end
if 6 ~= #(P[relation][4]) then error('not enough relations of kind 1') end
if 6 ~= #(P[relation][5]) then error('not enough relations of kind 1') end
if 6 ~= #(P[relation][6]) then error('not enough relations of kind 1') end
if 6 ~= #(P[need]) then error('not enough need kind') end
if 6 ~= #(P[need][1]) then error('not enough needs of kind 1') end
if 6 ~= #(P[need][2]) then error('not enough needs of kind 1') end
if 6 ~= #(P[need][3]) then error('not enough needs of kind 1') end
if 6 ~= #(P[need][4]) then error('not enough needs of kind 1') end
if 6 ~= #(P[need][5]) then error('not enough needs of kind 1') end
if 6 ~= #(P[need][6]) then error('not enough needs of kind 1') end
if 6 ~= #(P[object]) then error('not enough object kind') end
if 6 ~= #(P[object][1]) then error('not enough objects of kind 1') end
if 6 ~= #(P[object][2]) then error('not enough objects of kind 1') end
if 6 ~= #(P[object][3]) then error('not enough objects of kind 1') end
if 6 ~= #(P[object][4]) then error('not enough objects of kind 1') end
if 6 ~= #(P[object][5]) then error('not enough objects of kind 1') end
if 6 ~= #(P[object][6]) then error('not enough objects of kind 1') end
if 6 ~= #(P[location]) then error('not enough location kind') end
if 6 ~= #(P[location][1]) then error('not enough locations of kind 1') end
if 6 ~= #(P[location][2]) then error('not enough locations of kind 1') end
if 6 ~= #(P[location][3]) then error('not enough locations of kind 1') end
if 6 ~= #(P[location][4]) then error('not enough locations of kind 1') end
if 6 ~= #(P[location][5]) then error('not enough locations of kind 1') end
if 6 ~= #(P[location][6]) then error('not enough locations of kind 1') end
local count = 0
for _ in fiasco_playset_data:gmatch('[^\n]*') do
  count = count + 1
end
if 174 ~= count then error('wrong number of lines '..tonumber(count)) end

--------------------------------

for _, s in ipairs(scenarios) do
  io.write(nextscenario())
  for k, p in ipairs(s.players) do
    io.write(randomname(k))
    io.write(playitem(P[relation][p.relation_section][p.relation_item]))
    io.write(playitem(P[p.detail_kind][p.detail_section][p.detail_item]))
  end
end

end

