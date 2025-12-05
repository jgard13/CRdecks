-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2025 at 06:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clashroyaledb`
--

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `ELIXIR_COST` int(11) NOT NULL,
  `RARITY` varchar(20) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `Url_Card` varchar(8) DEFAULT NULL,
  `IMAGE_PATH` varchar(100) NOT NULL,
  `HAS_EVOLUTION` tinyint(1) NOT NULL,
  `EVOLUTION_IMAGE_PATH` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`ID`, `NAME`, `ELIXIR_COST`, `RARITY`, `description`, `Url_Card`, `IMAGE_PATH`, `HAS_EVOLUTION`, `EVOLUTION_IMAGE_PATH`) VALUES
(1, 'Archer Queen', 5, 'Champion', 'She is fast, deadly and hard to catch. Beware of her invisibility!', '26000072', '/img/cartas/ArcherQueen.png', 0, NULL),
(2, 'Boss Bandit', 5, 'Champion', 'The boss of the Forest Gang finally shows her face in the Arena! She uses her Dash ability to charge opponents, but don\'t look directly at her eyes!', '26000103', '/img/cartas/BossBandit.png', 0, NULL),
(3, 'Golden Knight', 4, 'Champion', 'Charges into battle with a chain dash, bouncing between enemies. He\'s always looking for the next heroic deed!', '26000074', '/img/cartas/GoldenKnight.png', 0, NULL),
(4, 'Goblinstein', 5, 'Champion', 'This monstrous creation of the Goblins has a taste for Tower damage! Upon his mighty death, he explodes, summoning two little Goblinsteins.', '26000099', '/img/cartas/Goblinstein.png', 0, NULL),
(5, 'Little Prince', 3, 'Champion', 'He defends his royal ground and his Royal Guard, shooting faster and faster with every attack. When he\'s not fighting, he\'s busy smelling roses.', '26000093', '/img/cartas/LittlePrince.png', 0, NULL),
(6, 'Mighty Miner', 4, 'Champion', 'A heavily armored Miner with a mean streak and a HUGE drill. When he loses his helmet, he digs a hole and charges to the other side!', '26000065', '/img/cartas/MightyMiner.png', 0, NULL),
(7, 'Monk', 5, 'Champion', 'He throws mystical Elixir orbs and can deflect any projectile aimed his way, even The Log! He has mastered the art of \"Flow,\" which makes him strike faster with every third hit.', '26000077', '/img/cartas/Monk.png', 0, NULL),
(8, 'Skeleton King', 4, 'Champion', 'He is the King of the Undead, but not the King of personal hygiene. His ability summons an army of dead allies.', '26000069', '/img/cartas/SkeletonKing.png', 0, NULL),
(9, 'Bandit', 3, 'Legendary', 'Spawns and dashes between enemies, becoming invincible during the charge. She lives for the thrill of the fight!', '26000046', '/img/cartas/Bandit.png', 0, NULL),
(10, 'Electro Wizard', 4, 'Legendary', 'He zaps enemies with bolts of electricity! He lands with a *ZAP*, stunning nearby troops.', '26000042', '/img/cartas/eWiz.png', 0, NULL),
(11, 'Fisherman', 3, 'Legendary', 'Throws his anchor to pull himself to buildings or to pull an enemy to him. Upon impact, the enemy is briefly stunned.', '26000061', '/img/cartas/Fisherman.png', 0, NULL),
(12, 'Royal Ghost', 3, 'Legendary', 'A spectral swordsman who can pass through walls and only appears to attack. Spooky!', '26000050', '/img/cartas/Ghost.png', 1, '/img/cartas/Ghost (1).png'),
(13, 'Graveyard', 5, 'Legendary', 'Surprises enemies with a large graveyard of Skeletons! They won\'t stop until they reach the closest structure.', '28000010', '/img/cartas/Graveyard.png', 0, NULL),
(14, 'Ice Wizard', 3, 'Legendary', 'Shoots ice shards that slow down enemies and damage troops over time. He is quite chilly!', '26000023', '/img/cartas/IceWiz.png', 0, NULL),
(15, 'Inferno Dragon', 4, 'Legendary', 'Shoots a beam of fire that gains power over time. Dragons fear his fiery wrath!', '26000037', '/img/cartas/InfernoD (1).png', 1, '/img/cartas/InfernoD.png'),
(16, 'Lava Hound', 7, 'Legendary', 'A slow but powerful flying unit that attacks buildings. Upon death, it splits into six Lava Pups that are just as hot!', '26000029', '/img/cartas/Lava.png', 0, NULL),
(17, 'The Log', 2, 'Legendary', 'A bottle of Elixir spilled and brought this Log to life! It rolls through the arena, crushing ground troops and knocking back anything that survives.', '28000011', '/img/cartas/Log.png', 0, NULL),
(18, 'Lumberjack', 4, 'Legendary', 'He is fast, deals high damage and drops a bottle of Rage when he is defeated. He has an axe to grind!', '26000035', '/img/cartas/Lumber.png', 1, '/img/cartas/Lumber (1).png'),
(19, 'Magic Archer', 4, 'Legendary', 'Shoots a magic arrow that passes through everything in its path, dealing damage to all units and buildings.', '26000062', '/img/cartas/MagicArcher.png', 0, NULL),
(20, 'Mega Knight', 7, 'Legendary', 'Jumps into battle with devastating splash damage and a glorious metal moustache.', '26000055', '/img/cartas/MegaKnight.png', 1, '/img/cartas/MegaKnight (1).png'),
(21, 'Miner', 3, 'Legendary', 'Can tunnel underground and appear anywhere on the battlefield. He\'s quite a hard worker!', '26000032', '/img/cartas/Miner.png', 0, NULL),
(22, 'Mother Witch', 4, 'Legendary', 'Zaps nearby enemies and turns defeated troops into Cursed Hogs. You\'ll be cursing too when her Hogs take your tower!', '26000083', '/img/cartas/MotherWitch.png', 0, NULL),
(23, 'Night Witch', 4, 'Legendary', 'Summons Bats and deals damage with her massive stick. When she is defeated, she unleashes a final swarm of Bats!', '26000048', '/img/cartas/NightWitch.png', 0, NULL),
(24, 'Phoenix', 4, 'Legendary', 'A fiery bird with a second chance! If defeated, it returns to the arena, resurrecting after a few seconds.', '26000087', '/img/cartas/Phoenix.png', 0, NULL),
(25, 'Princess', 3, 'Legendary', 'Shoots a flaming arrow that deals damage from across the river! She is royalty and she knows it.', '26000026', '/img/cartas/Princess.png', 0, NULL),
(26, 'Ram Rider', 5, 'Legendary', 'A fast, long-range attacker that deals a powerful hit after charging, followed by a net to slow down enemies.', '26000051', '/img/cartas/RamRider.png', 0, NULL),
(27, 'Sparky', 6, 'Legendary', 'A giant spark machine that slowly charges up and fires a devastating blast of electricity.', '26000033', '/img/cartas/Sparky.png', 0, NULL),
(28, 'Goblin Machine', 4, 'Legendary', 'This fast, armored vehicle drops two Goblins as it races to the nearest building. Upon reaching it, it drops two more Goblins and begins attacking.', '26000096', '/img/cartas/GoblinMachine.png', 0, NULL),
(29, 'Spirit Empress', 4, 'Legendary', 'She wields a spectral scythe to cleave through enemies! Her charged attack slows down opponents and drains their spirit!', '28000025', '/img/cartas/SpiritEmpress.png', 0, NULL),
(30, 'Baby Dragon', 4, 'Epic', 'A flying unit with a big heart and even bigger breath. Deals splash damage, but is easily distracted.', '26000015', '/img/cartas/BabyD.png', 1, '/img/cartas/BabyD (1).png'),
(31, 'Balloon', 5, 'Epic', 'A building-targeting unit that drops bombs and deals death damage upon impact.', '26000006', '/img/cartas/Balloon.png', 0, NULL),
(32, 'Barbarian Barrel', 2, 'Epic', 'Rolling through the arena, crushing everything in its path, until it hits a target or runs out of momentum. Then, a Barbarian bursts out!', '28000015', '/img/cartas/BarbBarrel.png', 0, NULL),
(33, 'Bowler', 5, 'Epic', 'A large blue dude who rolls a big boulder that deals splash damage and knocks back ground units.', '26000034', '/img/cartas/Bowler.png', 0, NULL),
(34, 'Clone', 3, 'Epic', 'Clones all troops in the area! Cloned troops have the same stats but minimal health.', '28000013', '/img/cartas/Clone.png', 0, NULL),
(35, 'Dark Prince', 4, 'Epic', 'A faster and more heavily armored Prince with an epic charge. He prefers not to ride his pony into battle, as it is afraid of the dark.', '26000027', '/img/cartas/DarkPrince.png', 1, NULL),
(36, 'Electro Dragon', 5, 'Epic', 'A heavy flying unit that attacks with chain lightning, dealing damage to multiple enemies.', '26000063', '/img/cartas/eDragon.png', 1, '/img/cartas/eDragon (1).png'),
(37, 'Executioner', 5, 'Epic', 'Throws a massive axe that deals damage on its way out AND its way back! He\'s always prepared for a double-hit.', '26000045', '/img/cartas/Exe.png', 1, '/img/cartas/Exe(1).png'),
(38, 'Freeze', 4, 'Epic', 'Temporarily freezes all troops and buildings in its radius. It is quite chilly!', '28000005', '/img/cartas/Freeze.png', 0, NULL),
(39, 'Giant Skeleton', 6, 'Epic', 'A giant skeleton that drops a massive bomb when he dies. He is heavy and very slow.', '26000020', '/img/cartas/GiantSkelly.png', 0, NULL),
(40, 'Goblin Giant', 6, 'Epic', 'A huge Goblin carrying a giant backpack... with two Spear Goblins inside!', '26000060', '/img/cartas/GobGiant.png', 1, '/img/cartas/GobGiant (1).png'),
(41, 'Goblin Curse', 2, 'Epic', 'Curses the target area for a short time. Any enemy that dies in the cursed area spawns a bunch of little Goblins!', '28000024', '/img/cartas/GoblinCurse.png', 0, NULL),
(42, 'Cannon Cart', 5, 'Epic', 'A fast-rolling cannon that turns into a stationary building upon destruction.', '26000054', '/img/cartas/CannonCart.png', 0, NULL),
(43, 'Goblin Drill', 4, 'Epic', 'Tunnels to the nearest tower and spawns Goblins along the way. Upon reaching the tower, it acts as a Goblin Hut.', '27000013', '/img/cartas/GoblinDrill.png', 1, '/img/cartas/GoblinDrill (1).png'),
(44, 'Golem', 8, 'Epic', 'A massive, slow-moving building-targeting unit that splits into two Golemites when defeated.', '26000009', '/img/cartas/Golem.png', 0, NULL),
(45, 'Guards', 3, 'Epic', 'Three Skeletons with shields that can absorb a lot of damage. They are the best defense!', '26000025', '/img/cartas/Guards.png', 1, NULL),
(46, 'Hunter', 4, 'Epic', 'Shoots a tight spread of projectiles that deal massive damage up close but very little damage from far away.', '26000044', '/img/cartas/Hunter.png', 1, '/img/cartas/Hunter (1).png'),
(47, 'Lightning', 6, 'Epic', 'Strikes the three strongest enemy units and buildings in the target area. It is electric!', '28000007', '/img/cartas/Lightning.png', 0, NULL),
(48, 'Mirror', 0, 'Epic', 'Creates a copy of the last deployed card, with an extra Elixir cost.', '28000006', '/img/cartas/Mirror.png', 0, NULL),
(49, 'P.E.K.K.A.', 7, 'Epic', 'A heavily armored, slow, close-range ground unit with a love for butterflies. What\'s behind the mask? Nobody knows!', '26000004', '/img/cartas/PEKKA.png', 1, '/img/cartas/PEKKA (1).png'),
(50, 'Poison', 4, 'Epic', 'Deals damage over time to enemy troops and buildings in the target area.', '28000009', '/img/cartas/Poison.png', 0, NULL),
(51, 'Prince', 5, 'Epic', 'A fast-charging unit that deals double damage on his first hit. He rides a royal pony that is afraid of the dark.', '26000016', '/img/cartas/Prince.png', 1, NULL),
(52, 'Rage', 2, 'Epic', 'Increases the attack and movement speed of all friendly units in the target area.', '28000002', '/img/cartas/Rage.png', 0, NULL),
(53, 'Rune Giant', 6, 'Epic', 'This slow giant only targets buildings! He carries two rune totems which create a protective shield around him and his allies.', '26000101', '/img/cartas/RuneGiant.png', 0, NULL),
(54, 'Skeleton Army', 3, 'Epic', 'Summons a massive army of Skeletons that can overwhelm single-target units.', '26000012', '/img/cartas/Skeleton army.png', 0, NULL),
(55, 'Tornado', 3, 'Epic', 'Pulls all enemy troops towards the center of the spell, dealing damage over time.', '28000012', '/img/cartas/Tornado.png', 0, NULL),
(56, 'Void', 3, 'Epic', 'Pulls nearby troops toward the center, dealing huge damage to all enemies inside the radius.', '28000023', '/img/cartas/Void.png', 0, NULL),
(57, 'Wall Breakers', 2, 'Epic', 'Two Skeletons with bombs that only attack buildings. They are very fast and easily distracted.', '26000058', '/img/cartas/WallBreakers.png', 1, '/img/cartas/WallBreakers (1).png'),
(58, 'Witch', 5, 'Epic', 'Summons Skeletons and shoots blasts of area damage. Spooky!', '26000007', '/img/cartas/Witch.png', 1, '/img/cartas/Witch (1).png'),
(59, 'Goblin Barrel', 3, 'Epic', 'Spawns three Goblins anywhere in the Arena. It´s going to be a thrilling ride, boys!', '28000004', '/img/cartas/Barrel.png', 1, '/img/cartas/Barrel (1).png'),
(60, 'X-Bow', 6, 'Epic', 'A stationary siege weapon that can attack towers from across the river!', '27000008', '/img/cartas/XBow.png', 0, NULL),
(61, 'Vines', 3, 'Epic', 'Immobilizes enemy troops and deals continuous damage over time.', '28000026', '/img/cartas/Vines.png', 0, NULL),
(62, 'Electro Giant', 7, 'Epic', 'He\'s bulky, he\'s beefy, and he\'s *electric*! Attacks buildings and zaps all nearby enemies.', '26000085', '/img/cartas/ElectroGiant.png', 0, NULL),
(63, 'Three Musketeers', 9, 'Rare', 'Three Musketeers for the price of... three Musketeers!', '26000028', '/img/cartas/Three Musketeers.png', 0, NULL),
(64, 'Battle Healer', 4, 'Rare', 'A melee fighter that heals herself and nearby allies. She never leaves a man behind!', '26000068', '/img/cartas/BattleHealer.png', 0, NULL),
(65, 'Bomb Tower', 4, 'Rare', 'A stationary defensive building that throws bombs, dealing splash damage to ground units.', '27000004', '/img/cartas/BombTower.png', 1, NULL),
(66, 'Dart Goblin', 3, 'Rare', 'A fast, long-range attacker that uses a blowgun. He also has a great sense of humor.', '26000040', '/img/cartas/DartGob.png', 1, '/img/cartas/DartGob (1).png'),
(67, 'Earthquake', 3, 'Rare', 'Damages and slows down ground troops and deals massive damage to buildings.', '28000014', '/img/cartas/Earthquake.png', 0, NULL),
(68, 'Elixir Golem', 3, 'Rare', 'A giant made of Elixir! Splits into Elixir Golemites, which then split into Elixir Blobs. When defeated, it gives the opponent Elixir.', '26000067', '/img/cartas/ElixirGolem.png', 0, NULL),
(69, 'Fireball', 4, 'Rare', 'Burns an area, dealing significant damage. Very effective against concentrated troops and squishy buildings.', '28000000', '/img/cartas/Fireball.png', 0, NULL),
(70, 'Flying Machine', 4, 'Rare', 'A fast-flying machine with a long range attack. It\'s a miracle it hasn\'t crashed yet!', '26000057', '/img/cartas/FlyingMachine.png', 0, NULL),
(71, 'Furnace', 4, 'Rare', 'A building that spawns two Fire Spirits at a time. It is quite hot!', '27000010', '/img/cartas/Furnace.png', 1, '/img/cartas/Furnace (1).png'),
(72, 'Goblin Cage', 4, 'Rare', 'A defensive building that releases a powerful Goblin Brawler when destroyed.', '27000012', '/img/cartas/GoblinCage.png', 0, NULL),
(73, 'Goblin Hut', 4, 'Rare', 'A building that spawns Spear Goblins at a time. It is quite smelly!', '27000001', '/img/cartas/GobHut.png', 0, NULL),
(74, 'Heal Spirit', 1, 'Rare', 'A tiny spirit that jumps towards enemies to heal all nearby friendly troops.', '28000016', '/img/cartas/HealSpirit.png', 0, NULL),
(75, 'Hog Rider', 4, 'Rare', 'Fast and focused on the nearest building. His rider prefers the arena to a polite conversation.', '26000021', '/img/cartas/Hog.png', 1, NULL),
(76, 'Ice Golem', 2, 'Rare', 'A slow, low-damage unit that explodes with an icy blast upon death, slowing down nearby enemies.', '26000038', '/img/cartas/IceGolem.png', 0, NULL),
(77, 'Inferno Tower', 5, 'Rare', 'A defensive building that shoots a beam of fire that gains power over time.', '27000003', '/img/cartas/Inferno.png', 0, NULL),
(78, 'Mega Minion', 3, 'Rare', 'A flying, heavily armored Minion with a powerful attack. He\'s bigger and meaner!', '26000039', '/img/cartas/Mega minion.png', 0, NULL),
(79, 'Mini P.E.K.K.A.', 4, 'Rare', 'Deals high damage but is easily distracted. He\'s also not very smart. \"Pancakes!\"', '26000018', '/img/cartas/MiniPeka.png', 0, NULL),
(80, 'Musketeer', 4, 'Rare', 'A long-range attacker who can hit both ground and air units. She is quite refined!', '26000014', '/img/cartas/Musk.png', 1, '/img/cartas/Musk (1).png'),
(81, 'Elixir Collector', 6, 'Rare', 'Produces Elixir over time, but is easily destroyed.', '27000007', '/img/cartas/Pump.png', 0, NULL),
(82, 'Rocket', 6, 'Rare', 'Launches a powerful rocket that deals massive damage to a small area.', '28000003', '/img/cartas/Rocket.png', 0, NULL),
(83, 'Royal Hogs', 5, 'Rare', 'A quartet of Hogs that race towards the nearest building. They are faster than a speeding bullet!', '26000059', '/img/cartas/RoyalHogs.png', 1, '/img/cartas/RoyalHogs (1).png'),
(84, 'Giant', 5, 'Rare', 'Slow but durable, only attacks buildings. A real party animal, thanks to his insatiable love for Elixir.', '26000003', '/img/cartas/Giant.png', 0, NULL),
(85, 'Barbarian Hut', 7, 'Rare', 'A building that spawns Barbarians at a time. It is quite sturdy!', '27000005', '/img/cartas/BarbHut.png', 0, NULL),
(86, 'Tombstone', 3, 'Rare', 'A building that spawns Skeletons over time. Upon destruction, it releases four Skeletons!', '27000009', '/img/cartas/Tombstone.png', 0, NULL),
(87, 'Suspicious Bush', 3, 'Rare', 'A large, suspicious bush that hides two Goblins! When destroyed, the Goblins jump out and attack the nearest enemy.', '26000097', '/img/cartas/SuspiciousBush.png', 0, NULL),
(88, 'Valkyrie', 4, 'Rare', 'A strong, ground-based melee unit that attacks all surrounding units with her axe.', '26000011', '/img/cartas/Valkyrie.png', 1, '/img/cartas/Valkyrie (1).png'),
(89, 'Zappies', 4, 'Rare', 'Three tiny, zapping troops that stun nearby enemies. They can\'t walk, but they can hover!', '26000052', '/img/cartas/Zappies.png', 0, NULL),
(90, 'Battle Ram', 4, 'Rare', 'Two Barbarians carrying a ram that only attacks buildings. Upon impact, the Barbarians join the fight!', '26000036', '/img/cartas/Battle ram.png', 1, '/img/cartas/Battle ram (1).png'),
(91, 'Demolisher', 5, 'Rare', 'This giant Goblin is dressed in heavy armor and only attacks buildings. He deals massive damage with his heavy hammer.', '26000095', '/img/cartas/GoblinDemolisher.png', 0, NULL),
(92, 'Fire Wizard', 5, 'Rare', 'Shoots powerful fireballs that deal area damage. He is quite hot-headed!', '26000017', '/img/cartas/Wizard.png', 1, '/img/cartas/Wizard (1).png'),
(93, 'Archers', 3, 'Common', 'A pair of lightly armored ranged attackers. They\'ll help you take down ground and air units, but you\'re on your own with hair coloring advice.', '26000001', '/img/cartas/Archers.png', 1, '/img/cartas/Archers (1).png'),
(94, 'Arrows', 3, 'Common', 'Shoots a volley of arrows that deals damage to all troops in the target area.', '28000001', '/img/cartas/Arrows.png', 0, NULL),
(95, 'Barbarians', 5, 'Common', 'A group of five tough, close-range Barbarians. They are always angry!', '26000008', '/img/cartas/Barbs.png', 1, '/img/cartas/Barbs (1).png'),
(96, 'Bats', 2, 'Common', 'A group of four flying, low-hitpoint, high-damage units. They are quite spooky!', '26000049', '/img/cartas/Bats.png', 1, '/img/cartas/Bats (1).png'),
(97, 'Berserker', 3, 'Common', 'A very fast, close-range attacker that gains attack speed with every hit.', '26000102', '/img/cartas/Berserker.png', 0, NULL),
(98, 'Bomber', 3, 'Common', 'A fragile, ranged unit that throws bombs, dealing splash damage to ground units.', '26000013', '/img/cartas/Bomber.png', 1, '/img/cartas/Bomber (1).png'),
(99, 'Cannon', 3, 'Common', 'A stationary defensive building that attacks ground units.', '27000000', '/img/cartas/Cannon.png', 1, '/img/cartas/Cannon (1).png'),
(100, 'Electro Spirit', 1, 'Common', 'A tiny spirit that jumps towards enemies, dealing damage and stunning up to 9 enemy troops.', '26000084', '/img/cartas/ElectroSpirit.png', 0, NULL),
(101, 'Firecracker', 3, 'Common', 'A fragile ranged unit that shoots fireworks! Her attacks knock her back and deal area damage.', '26000064', '/img/cartas/Firecracker.png', 1, '/img/cartas/Firecracker (1).png'),
(102, 'Fire Spirit', 1, 'Common', 'A tiny spirit that jumps towards enemies, exploding upon impact and dealing area damage.', '26000031', '/img/cartas/FireSpirit.png', 0, NULL),
(103, 'Goblin Gang', 3, 'Common', 'A group of three Spear Goblins and three Goblins. They are very fast and easily distracted.', '26000041', '/img/cartas/GobGang.png', 0, NULL),
(104, 'Goblins', 2, 'Common', 'Three fast, low-hitpoint, high-damage melee attackers. They prefer quantity over quality... and stealing Elixir.', '26000002', '/img/cartas/Gobs.png', 0, NULL),
(105, 'Minion Horde', 5, 'Common', 'A large group of six flying, low-hitpoint units. They are quite fast!', '26000022', '/img/cartas/Horde.png', 0, NULL),
(106, 'Ice Spirit', 1, 'Common', 'A tiny spirit that jumps towards enemies, freezing them upon impact.', '26000030', '/img/cartas/IceSpirit.png', 1, '/img/cartas/IceSpirit (1).png'),
(107, 'Knight', 3, 'Common', 'A trusty, well-rounded melee fighter. He\'s so handsome, his good looks are considered a weapon.', '26000000', '/img/cartas/Knight.png', 0, NULL),
(108, 'Minions', 3, 'Common', 'A group of three flying, low-hitpoint units. They are quite fast!', '26000005', '/img/cartas/Minions.png', 0, NULL),
(109, 'Mortar', 4, 'Common', 'A stationary defensive building that shoots explosive shells over walls.', '27000002', '/img/cartas/Mortar.png', 1, '/img/cartas/Mortar (1).png'),
(110, 'Rascals', 5, 'Common', 'A fast, close-range male Rascal and two ranged female Rascals. They are quite mischievous!', '26000053', '/img/cartas/Rascals.png', 0, NULL),
(111, 'Royal Recruits', 6, 'Common', 'A group of six armored Recruits that can be deployed across the map. They are quite sturdy!', '26000047', '/img/cartas/RoyalRecruits.png', 1, '/img/cartas/RoyalRecruits (1).png'),
(112, 'Royal Giant', 6, 'Common', 'A slow-moving, building-targeting unit that attacks from a long range with his cannon.', '26000024', '/img/cartas/Royal giant.png', 1, '/img/cartas/Royal giant (1).png'),
(113, 'Skeleton Barrel', 3, 'Common', 'A flying barrel that drops Skeletons upon destruction. It only targets buildings.', '26000056', '/img/cartas/Skeleton barrel.png', 1, '/img/cartas/Skeleton barrel (1).png'),
(114, 'Skeleton Dragons', 4, 'Common', 'A pair of flying dragons that shoot fiery breath at enemies. They are quite fast!', '26000080', '/img/cartas/SkeletonDragons.png', 0, NULL),
(115, 'Skeletons', 1, 'Common', 'Four fast, low-hitpoint, close-range Skeletons. They are quite numerous!', '26000010', '/img/cartas/Skeletons.png', 1, '/img/cartas/Skeletons (1).png'),
(116, 'Giant Snowball', 2, 'Common', 'Rolls a giant snowball that damages and slows down all enemy units in the target area.', '28000017', '/img/cartas/Snowball.png', 1, '/img/cartas/Snowball (1).png'),
(117, 'Spear Goblins', 2, 'Common', 'Three fast, low-hitpoint, long-range attackers. They prefer quantity over quality... and stealing Elixir.', '26000019', '/img/cartas/SpearGobs.png', 0, NULL),
(118, 'Tesla', 4, 'Common', 'A defensive building that attacks ground and air units. It disappears underground when not attacking.', '27000006', '/img/cartas/Tesla.png', 1, '/img/cartas/Tesla (1).png'),
(119, 'Zap', 2, 'Common', 'Zaps all enemy troops in the target area, dealing damage and briefly stunning them.', '28000008', '/img/cartas/Zap.png', 1, '/img/cartas/Zap (1).png'),
(120, 'Elite Barbarians', 6, 'Common', 'Two Barbarians who train longer, run faster and hit harder than their regular counterparts.', '26000043', '/img/cartas/eBarbs.png', 0, NULL),
(121, 'Royal Delivery', 3, 'Common', 'Drops a giant Royal Delivery Crate that crushes enemies and releases a Royal Recruit upon impact.', '28000018', '/img/cartas/RoyalDelivery.png', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `decks`
--

CREATE TABLE `decks` (
  `deck_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `avg_elixir` decimal(3,1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Table structure for table `decks_cards`
--

CREATE TABLE `decks_cards` (
  `deck_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`) VALUES
(1, 'jgard13', '123123'),
(2, 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `decks`
--
ALTER TABLE `decks`
  ADD PRIMARY KEY (`deck_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `decks_cards`
--
ALTER TABLE `decks_cards`
  ADD PRIMARY KEY (`deck_id`,`position`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `decks`
--
ALTER TABLE `decks`
  MODIFY `deck_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `decks`
--
ALTER TABLE `decks`
  ADD CONSTRAINT `decks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `decks_cards`
--
ALTER TABLE `decks_cards`
  ADD CONSTRAINT `decks_cards_ibfk_1` FOREIGN KEY (`deck_id`) REFERENCES `decks` (`deck_id`),
  ADD CONSTRAINT `decks_cards_ibfk_2` FOREIGN KEY (`card_id`) REFERENCES `cards` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
