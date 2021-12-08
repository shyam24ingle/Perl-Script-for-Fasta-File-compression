# write a perl program to compress DNA sequence into unknown sequence. 
print"\nEnter a File NAME:\n";
$DNA=<>;
unless(open(IN,$DNA))
        {
	print"could not open File $DNA";
               exit;
        }
   @DNA=<IN>;
$info=shift(@DNA);   
$seq=join('',@DNA);
   $seq=~s/\s//g;
   $lenseq=length($seq);
   print"\nlength of seq is = $lenseq\n$seq\n";
	
        
	my $protein='';
	my $codon;


	for (my$i=0;$i<(length($seq)-1);$i+=2)
	    {
             $codon=substr($seq,$i,2);
	     $protein.=codon2aa($codon);
		
	    }

$lenpro=length($protein);
  print"Original data is:\n\n$info\n $protein \n\nlength of seq = $lenpro";
print"\nThe uncompress sequence stored in C:perl:bin:uncompress.fasta";
$compress="uncompress.fasta";
open(FILE ,">",$compress); 
print FILE "$info\n$protein";
close FILE;
exit;

sub codon2aa
	
	{
	  my ($codon)=@_;
	  #$codon=uc($codon);
	  %genetic_code=('Q4'=>'AAAA',	'Q1'=>'TAAA',	'Q2'=>'GAAA',	'Q3'=>'CAAA',
'W4'=>'AAAT',    'W1'=>'TAAT',	'W2'=>'GAAT',	'W3'=>'CAAT',
'E4'=>'AAAG',    'E1'=>'TAAG',	'E2'=>'GAAG',	'E3'=>'CAAG',
'R4'=>'AAAC',	 'R1'=>'TAAC',	'R2'=>'GAAC',	'R3'=>'CAAC',

'Y4'=>'AATA',	'Y1'=>'TATA',	'Y2'=>'GATA',	'Y3'=>'CATA',
'U4'=>'AATT',	'U1'=>'TATT',	'U2'=>'GATT',	'U3'=>'CATT',
'I4'=>'AATG',	'I1'=>'TATG',	'I2'=>'GATG',	'I3'=>'CATG',
'O4'=>'AATC',	'O1'=>'TATC',	'O2'=>'GATC',	'O3'=>'CATC',

'P4'=>'AAGA',	'P1'=>'TAGA',	'P2'=>'GAGA',	'P3'=>'CAGA',
'S4'=>'AAGT',	'S1'=>'TAGT',	'S2'=>'GAGT',	'S3'=>'CAGT',
'D4'=>'AAGG',	'D1'=>'TAGG',	'D2'=>'GAGG',	'D3'=>'CAGG',
'F4'=>'AAGC',	'F1'=>'TAGC',	'F2'=>'GAGC',	'F3'=>'CAGC',

'H4'=>'AACA',	'H1'=>'TACA',	'H2'=>'GACA',	'H3'=>'CACA',
'J4'=>'AACT',	'J1'=>'TACT',	'J2'=>'GACT',	'J3'=>'CACT',
'K4'=>'AACG',	'K1'=>'TACG',	'K2'=>'GACG',	'K3'=>'CACG',
'L4'=>'AACC',	'L1'=>'TACC',	'L2'=>'GACC',	'L3'=>'CACC',

'Z4'=>'ATAA',	'Z1'=>'TTAA',	'Z2'=>'GTAA',	'Z3'=>'CTAA',
'X4'=>'ATAT',	'X1'=>'TTAT',	'X2'=>'GTAT',	'X3'=>'CTAT',
'V4'=>'ATAG',	'V1'=>'TTAG',	'V2'=>'GTAG',	'V3'=>'CTAG',
'B4'=>'ATAC',	'B1'=>'TTAC',	'B2'=>'GTAC',	'B3'=>'CTAC',

'N4'=>'ATTA',	'N1'=>'TTTA',	'N2'=>'GTTA',	'N3'=>'CTTA',
'M4'=>'ATTT',	'M1'=>'TTTT',	'M2'=>'GTTT',	'M3'=>'CTTT',
'q4'=>'ATTG',	'q1'=>'TTTG',	'q2'=>'GTTG',	'q3'=>'CTTG',
'w4'=>'ATTC',	'w1'=>'TTTC',	'w2'=>'GTTC',	'w3'=>'CTTC',

'e4'=>'ATGA',	'e1'=>'TTGA',	'e2'=>'GTGA',	'e3'=>'CTGA',
'r4'=>'ATGT',	'r1'=>'TTGT',	'r2'=>'GTGT',	'r3'=>'CTGT',
'y4'=>'ATGG',	'y1'=>'TTGG',	'y2'=>'GTGG',	'y3'=>'CTGG',
'u4'=>'ATGC',	'u1'=>'TTGC',	'u2'=>'GTGC',	'u3'=>'CTGC',

'i4'=>'ATCA',	'i1'=>'TTCA',	'i2'=>'GTCA',	'i3'=>'CTCA',
'o4'=>'ATCT',	'o1'=>'TTCT',	'o2'=>'GTCT',	'o3'=>'CTCT',
'p4'=>'ATCG',	'p1'=>'TTCG',	'p2'=>'GTCG',	'p3'=>'CTCG',
'+4'=>'ATCC',	'+1'=>'TTCC',	'+2'=>'GTCC',	'+3'=>'CTCC',

's4'=>'AGAA',	's1'=>'TGAA',	's2'=>'GGAA',	's3'=>'CGAA',
'd4'=>'AGAT',	'd1'=>'TGAT',	'd2'=>'GGAT',	'd3'=>'CGAT',
'f4'=>'AGAG',	'f1'=>'TGAG',	'f2'=>'GGAG',	'f3'=>'CGAG',
'h4'=>'AGAC',	'h1'=>'TGAC',	'h2'=>'GGAC',	'h3'=>'CGAC',

'j4'=>'AGTA',	'j1'=>'TGTA',	'j2'=>'GGTA',	'j3'=>'CGTA',
'k4'=>'AGTT',	'k1'=>'TGTT',	'k2'=>'GGTT',	'k3'=>'CGTT',
'l4'=>'AGTG',	'l1'=>'TGTG',	'l2'=>'GGTG',	'l3'=>'CGTG',
'z4'=>'AGTC',	'z1'=>'TGTC',	'z2'=>'GGTC',	'z3'=>'CGTC',

'x4'=>'AGGA',	'x1'=>'TGGA',	'x2'=>'GGGA',	'x3'=>'CGGA',
'v4'=>'AGGT',	'v1'=>'TGGT',	'v2'=>'GGGT',	'v3'=>'CGGT',
'b4'=>'AGGG',	'b1'=>'TGGG',	'b2'=>'GGGG',	'b3'=>'CGGG',
'n4'=>'AGGC',	'n1'=>'TGGC',	'n2'=>'GGGC',	'n3'=>'CGGC',

'm4'=>'AGCA',	'm1'=>'TGCA',	'm2'=>'GGCA',	'm3'=>'CGCA',
'<4'=>'AGCT',	'<1'=>'TGCT',	'<2'=>'GGCT',	'<3'=>'CGCT',
'>4'=>'AGCG',	'>1'=>'TGCG',	'>2'=>'GGCG',	'>3'=>'CGCG',
'?4'=>'AGCC',	'?1'=>'TGCC',	'?2'=>'GGCC',	'?3'=>'CGCC',

'/4'=>'ACAA',	'/1'=>'TCAA',	'/2'=>'GCAA',	'/3'=>'CCAA',
'}4'=>'ACAT',	'}1'=>'TCAT',	'}2'=>'GCAT',	'}3'=>'CCAT',
'|4'=>'ACAG',	'|1'=>'TCAG',	'|2'=>'GCAG',	'|3'=>'CCAG',
'=4'=>'ACAC',	'=1'=>'TCAC',	'=2'=>'GCAC',	'=3'=>'CCAC',

']4'=>'ACTA',	']1'=>'TCTA',	']2'=>'GCTA',	']3'=>'CCTA',
'[4'=>'ACTT',	'[1'=>'TCTT',	'[2'=>'GCTT',	'[3'=>'CCTT',
'~4'=>'ACTG',	'~1'=>'TCTG',	'~2'=>'GCTG',	'~3'=>'CCTG',
'!4'=>'ACTC',	'!1'=>'TCTC',	'!2'=>'GCTC',	'!3'=>'CCTC',

'@4'=>'ACGA',	'@1'=>'TCGA',	'@2'=>'GCGA',	'@3'=>'CCGA',
'#4'=>'ACGT',	'#1'=>'TCGT',	'#2'=>'GCGT',	'#3'=>'CCGT',
'$4'=>'ACGG',	'$1'=>'TCGG',	'$2'=>'GCGG',	'$3'=>'CCGG',
'%4'=>'ACGC',	'%1'=>'TCGC',	'%2'=>'GCGC',	'^3'=>'CCGC',

'^4'=>'ACCA',	'^1'=>'TCCA',	'^2'=>'GCCA',	'^3'=>'CCCA',
'&4'=>'ACCT',	'&1'=>'TCCT',	'&2'=>'GCCT',	'&3'=>'CCCT',
'*4'=>'ACCG',	'*1'=>'TCCG',	'*2'=>'GCCG',	'*3'=>'CCCG',
'_4'=>'ACCC',	'_1'=>'TCCC',	'_2'=>'GCCC',	'_3'=>'CCCC');





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

