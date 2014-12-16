#! /usr/bin/perl

use strict;

my @unspeclist = (67, 77, 99, 113, 131, 137, 140, 147, 148, 156, 158, 171, 172, 173, 174, 176, 207, 208, 210, 211, 212, 213, 224, 225, 226, 235, 241, 250, 252, 256, 257, 258, 261, 262, 265, 269, 273, 274, 278, 279, 286, 291, 293, 295, 296, 298, 300, 301, 305, 308, 311, 315, 316, 320, 323, 326, 335, 340, 342, 360, 362, 363, 364, 365, 369, 371, 373, 382, 388, 390, 391, 392, 396, 398, 399, 400, 401, 402, 403, 416, 421, 424..433, 437, 438, 441, 443, 445, 447, 448, 450..453, 456, 457, 461, 464, 466..469, 471, 474..476, 479, 481, 489, 492..494, 497, 500..503, 509..511, 513, 514, 517, 518, 520, 521, 523, 526, 528, 531, 540..542, 545, 546, 552, 553, 556..558, 562, 563, 566, 567, 569..572, 574, 575, 578..581, 584..586, 588, 590, 592..597, 599, 600, 602..604, 607, 612, 617..620, 625, 626, 632..635, 639, 640, 642, 645..657, 660..662, 664, 666, 670, 676, 681, 698, 703, 713, 717..722);

my $strphykey = 528;

open MyFH, ">addunspec.sql";

foreach my $listmem (@unspeclist)
{
print MyFH "INSERT INTO gbl_strain_phylogeny (strain_phylogeny_id, strain_id, phylogeny_id) VALUES( $strphykey, $listmem, 99 );\n";

$strphykey++;

}
