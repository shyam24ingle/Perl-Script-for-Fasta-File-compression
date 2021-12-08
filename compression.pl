#perl program to compress DNA sequence into unknown sequenced. 

my $ma=312.2,$mg=328.2,$mc=288.2,$mt=303.2,$mu=238.2;
my $a=0,$t=0,$g=0,$c=0,$n=0,$u=0;


print"\nEnter a File NAME:\n";
$fDNA=<>;
unless(open(IN,$fDNA))
        {
	print"could not open File $fDNA";
               exit;
        }
   @DNA=<IN>;
   
  $info=shift(@DNA); 
  $seq=join('',@DNA);
  $_=$info;
  print"Information of FASTA file:\n$info\n";

	/(\d+)/;
  print"\nThe Sequence id is: $&";

	/(\w+\d+\W+\d+)/;
  print"\nThe reffrance database id is:$&";


	/(\s)(\,)/;
  print"\nOrganism name is: $'";

$seq=~s/\s//g;
@seq2=split('',$seq);
foreach $base(@seq2)
{
if($base eq 't' || $base eq 'T') 
{
$t++;
}
elsif($base eq 'a' || $base eq 'A')
{
$a++;
}
elsif($base eq 'g' || $base eq 'G')
{
$g++;
}
elsif($base eq 'c' || $base eq 'C')
{
$c++;
}
elsif($base eq 'u' || $base eq 'U')
{
$u++;
}
else
{
$n++;
}
}
$mold=$a*$ma+$t*$mt+$g*$mg+$c*$mc;
$molu=$a*$ma+$u*$mu+$g*$mg+$c*$mc;
if($n!=0)
{
print "\n\nThis is not nucleotide sequence\nNon nucliotide characteris = $n";
}
elsif($u>0&&$a>0&&$g>0&&$c>0&&$t<=0)
{
print "\n\nThis sequence is RNA sequence";
print "\nComposition of sequence is:\nA=$a\nG=$g\nC=$c\nU=$u";
print "\nThis is molecular weigth  of RNA sequence is: $mold";
}
elsif($t>0&&$a>0&&$g>0&&$c>0&&$u<=0)
{
print "\n\nThis sequence is DNA sequence.\n\nThe Sequence is\n\n$seq\n";
print "\nComposition of sequence is:\nA=$a\nT=$t\nG=$g\nC=$c";
print "\nThe molecular weigth  of DNA sequence is: $mold";
}
	

	
        $lenseq=length($seq);
        print"\nlength of seq is = $lenseq\n";
	
        my $DNA=$seq;
	my $protein='';
	my $codon;


	for (my$i=0;$i<(length($DNA)-2);$i+=4)
	    {
		$codon=substr($DNA,$i,4);
		$protein.=codon2aa($codon);
		
	    }

$lenpro=length($protein);
print"\ncompress data sequence is:\n $protein \n\nlength= $lenpro";
print"\nThis compress data stored in C:\perl:bin:compres.txt file\n";

$compress="compres.txt";
open(FILE ,">",$compress); 

print FILE "$info\n$protein";
close FILE;
exit;

my %genetic_code=(
'AAAA'=>'Q4',   'TAAA'=>'Q1',   'GAAA'=>'Q2',   'CAAA'=>'Q3',
'AAAT'=>'W4',	'TAAT'=>'W1',	'GAAT'=>'W2',	'CAAT'=>'W3',
'AAAG'=>'E4',	'TAAG'=>'E1',	'GAAG'=>'E2',	'CAAG'=>'E3',
'AAAC'=>'R4',	'TAAC'=>'R1',	'GAAC'=>'R2',	'CAAC'=>'R3',

'AATA'=>'Y4',	'TATA'=>'Y1',	'GATA'=>'Y2',	'CATA'=>'Y3',
'AATT'=>'U4',	'TATT'=>'U1',	'GATT'=>'U2',	'CATT'=>'U3',
'AATG'=>'I4',	'TATG'=>'I1',	'GATG'=>'I2',	'CATG'=>'I3',
'AATC'=>'O4',	'TATC'=>'O1',	'GATC'=>'O2',	'CATC'=>'O3',
			
'AAGA'=>'P4',	'TAGA'=>'P1',	'GAGA'=>'P2',	'CAGA'=>'P3',
'AAGT'=>'S4',	'TAGT'=>'S1',	'GAGT'=>'S2',	'CAGT'=>'S3',
'AAGG'=>'D4',	'TAGG'=>'D1',	'GAGG'=>'D2',	'CAGG'=>'D3',
'AAGC'=>'F4',	'TAGC'=>'F1',	'GAGC'=>'F2',	'CAGC'=>'F3',
		
'AACA'=>'H4',	'TACA'=>'H1',   'GACA'=>'H2',	'CACA'=>'H3',
'AACT'=>'J4',   'TACT'=>'J1',	'GACT'=>'J2',	'CACT'=>'J3',
'AACG'=>'K4',	'TACG'=>'K1',	'GACG'=>'K2',	'CACG'=>'K3',
'AACC'=>'L4',	'TACC'=>'L1',	'GACC'=>'L2',	'CACC'=>'L3',
			,
'ATAA'=>'Z4',	'TTAA'=>'Z1',	'GTAA'=>'Z2',	'CTAA'=>'Z3',
'ATAT'=>'X4',	'TTAT'=>'X1',	'GTAT'=>'X2',	'CTAT'=>'X3',
'ATAG'=>'V4',	'TTAG'=>'V1',	'GTAG'=>'V2',	'CTAG'=>'V3',
'ATAC'=>'B4',	'TTAC'=>'B1',	'GTAC'=>'B2',	'CTAC'=>'B3',
		
'ATTA'=>'N4',	'TTTA'=>'N1',	'GTTA'=>'N2',	'CTTA'=>'N3',
'ATTT'=>'M4',	'TTTT'=>'M1',	'GTTT'=>'M2',	'CTTT'=>'M3',
'ATTG'=>'q4',	'TTTG'=>'q1',	'GTTG'=>'q2',	'CTTG'=>'q3',
'ATTC'=>'w4',	'TTTC'=>'w1',	'GTTC'=>'w2',	'CTTC'=>'w3',
			
'ATGA'=>'e4',	'TTGA'=>'e1',	'GTGA'=>'e2',	'CTGA'=>'e3',
'ATGT'=>'r4',	'TTGT'=>'r1',	'GTGT'=>'r2',	'CTGT'=>'r3',
'ATGG'=>'y4',	'TTGG'=>'y1',	'GTGG'=>'y2',	'CTGG'=>'y3',
'ATGC'=>'u4',	'TTGC'=>'u1',	'GTGC'=>'u2',	'CTGC'=>'u3',
			
'ATCA'=>'i4',	'TTCA'=>'i1',	'GTCA'=>'i2',	'CTCA'=>'i3',
'ATCT'=>'o4',	'TTCT'=>'o1',	'GTCT'=>'o2',	'CTCT'=>'o3',
'ATCG'=>'p4',	'TTCG'=>'p1',	'GTCG'=>'p2',	'CTCG'=>'p3',
'ATCC'=>'+4',	'TTCC'=>'+1',	'GTCC'=>'+2',	'CTCC'=>'+3',
			
'AGAA'=>'s4',	'TGAA'=>'s1',	'GGAA'=>'s2',	'CGAA'=>'s3',
'AGAT'=>'d4',	'TGAT'=>'d1',	'GGAT'=>'d2',	'CGAT'=>'d3',
'AGAG'=>'f4',	'TGAG'=>'f1',	'GGAG'=>'f2',	'CGAG'=>'f3',
'AGAC'=>'h4',	'TGAC'=>'h1',	'GGAC'=>'h2',	'CGAC'=>'h3',
			
'AGTA'=>'j4',	'TGTA'=>'j1',	'GGTA'=>'j2',	'CGTA'=>'j3',
'AGTT'=>'k4',	'TGTT'=>'k1',	'GGTT'=>'k2',	'CGTT'=>'k3',
'AGTG'=>'l4',	'TGTG'=>'l1',   'GGTG'=>'l2',	'CGTG'=>'l3',
'AGTC'=>'z4',	'TGTC'=>'z1',	'GGTC'=>'z2',	'CGTC'=>'z3',
			
'AGGA'=>'x4',	'TGGA'=>'x1',	'GGGA'=>'x2',	'CGGA'=>'x3',
'AGGT'=>'v4',	'TGGT'=>'v1',	'GGGT'=>'v2',	'CGGT'=>'v3',
'AGGG'=>'b4',	'TGGG'=>'b1',	'GGGG'=>'b2',	'CGGG'=>'b3',
'AGGC'=>'n4',	'TGGC'=>'n1',	'GGGC'=>'n2',	'CGGC'=>'n3',
			
'AGCA'=>'m4',	'TGCA'=>'m1',	'GGCA'=>'m2',	'CGCA'=>'m3',
'AGCT'=>'<4',	'TGCT'=>'<1',	'GGCT'=>'<2',	'CGCT'=>'<3',
'AGCG'=>'>4',	'TGCG'=>'>1',	'GGCG'=>'>2',	'CGCG'=>'>3',
'AGCC'=>'?4',	'TGCC'=>'?1',	'GGCC'=>'?2',	'CGCC'=>'?3',
			
'ACAA'=>'/4',	'TCAA'=>'/1',	'GCAA'=>'/2',	'CCAA'=>'/3',
'ACAT'=>'}4',	'TCAT'=>'}1',	'GCAT'=>'}2',	'CCAT'=>'}3',
'ACAG'=>'|4',	'TCAG'=>'|1',	'GCAG'=>'|2',	'CCAG'=>'|3',
'ACAC'=>'=4',	'TCAC'=>'=1',	'GCAC'=>'=2',	'CCAC'=>'=3',
			
'ACTA'=>']4',	'TCTA'=>']1',	'GCTA'=>']2',	'CCTA'=>']3',
'ACTT'=>'[4',	'TCTT'=>'[1',	'GCTT'=>'[2',	'CCTT'=>'[3',
'ACTG'=>'~4',	'TCTG'=>'~1',	'GCTG'=>'~2',	'CCTG'=>'~3',
'ACTC'=>'!4',	'TCTC'=>'!1',	'GCTC'=>'!2',	'CCTC'=>'!3',
			
'ACGA'=>'@4',	'TCGA'=>'@1',	'GCGA'=>'@2',	'CCGA'=>'@3',
'ACGT'=>'#4',	'TCGT'=>'#1',	'GCGT'=>'#2',	'CCGT'=>'#3',
'ACGG'=>'$4',    'TCGG'=>'$1',	'GCGG'=>'$2',	'CCGG'=>'#3',
'ACGC'=>'%4',	'TCGC'=>'%1',	'GCGC'=>'%2',	'CCGC'=>'^3',
			
'ACCA'=>'^4',	'TCCA'=>'^1',	'GCCA'=>'^2',	'CCCA'=>'^3',
'ACCT'=>'&4',	'TCCT'=>'&1',	'GCCT'=>'&2',	'CCCT'=>'&3',
'ACCG'=>'*4',	'TCCG'=>'*1',	'GCCG'=>'*2',	'CCCG'=>'*3',
'ACCC'=>'_4',	'TCCC'=>'_1',  'GCCC'=>'_2',	'CCCC'=>'_3');


sub codon2aa
{
  my ($codon)=@_;
  $codon=uc($codon);
	  
  if(exists $genetic_code{$codon})
  {
    return $genetic_code{$codon};
  }
  else
  {
    print"Bad codon $codon";
    exit;
  }
		
}

