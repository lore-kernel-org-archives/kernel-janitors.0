From: vicente.feito@gmail.com
Date: Thu, 10 Feb 2005 19:27:12 +0000
Subject: [KJ] kj-devel.pl - new changes
Message-Id: <200502101927.13142.vicente.feito@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_RW7CCI9pb6bE7SB"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--Boundary-00=_RW7CCI9pb6bE7SB
Content-Type: multipart/alternative;
    boundary="----------=_1108074469-32306-609"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1108074469-32306-609
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi, well, I've added some new features to the script.
First, I've fixed the line number problems, although there are some highline 
numbers that may seem not quite correct, but I'm going to rewrite the 
check_unlock() function if Dave don't mind me doing it, Dave? Anyway, except 
in some special cases the number lines are OK.

Now the script is presented with three options, --includes --nospinlocks 
--nomodules, the --includes allows to check the include files inside the 
source code, both types of include files, locals #include "foo.h" and 
referred to the /lib/modules/`uname -r`/build/include tree (the default it's 
not to process include files) , --nospinlocks allows to avoid the check on 
spin_* functions, I've added this so if someone wants to avoid the checks for 
whatever reason, they can, at least until I rewrite this, of course the 
default it's to check for spinlocks. The --nomodules option came to mind 
cause Randy pointed that not all files are supposed to be modules, so I've 
added this option that by now it only restricts the module_init mechanism and 
the MODULE_AUTHOR/MODULE_DESC, etc, parts, I expect to add some more 'only 
per modules' checks in the days coming, that's why this option comes handy.

The foo comment was changed as Randy suggested, completely right, and now it's 
different the way in which the script handles files, so, there's no problem 
with line numbers stacking between files.

Randy, the comments should be skipped, I've tried with string.c and it didn't 
show me any comments, care to check with this one instead? I'm only checking 
for this kind of comments /* ... */ and multiple lines 
/* bar    /*      /*
 * foo  or    foo  or even   foo */
*/     */
but I'm not checking C++ style comments, like, //, which I'm going to add soon 
cause apparently there's a lot of people that use that style, shouldn't that 
be in the CodingStyles?
I've fixed the problem with return ERR(-EBUSY); and that kind of return codes, 
now you can return anything as long as it's not return ESOMETHING, or return 
<tab>EFOO; or whatever that may be similar.

You may see some code like this:
Unmatched ) in regex; marked by <-- HERE in m/spin_unlock.*) <-- HERE 
  inside ipc_lock_by_ptr(/ at /home/rddunlap/scripts/kj-devel-vic2.pl 
line 61

This code comes from the fact that there are several similar calls to 
spinlocks, but sometimes it's not a call, it's a declaration, and instead of 
having a spinlock_t inside the ( ), being a declaration, it has a datatype 
inside, and perl has two problems with this, if it has a data type, it's not 
a function call but a declaration, so It would not match anything related 
(like an unlock function, because it's not a call), and the second problem, 
if it's a declaration, we found not only types in it, but also more ()) ())
( and that makes the regex engine mad!, so, that's gonna dissapear as soon as 
I rewrite the spinlock checking code, again, if Dave allows me to.

I'm not using diff's because the code is small, and I would have to diff from 
the original devel.pl in the kerneljanitors page. Tell me if it's easier this 
way, or the other way, thank you.

Vicente.
------------=_1108074469-32306-609
Content-Type: text/html;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<html><head><meta DEFANGED_name="qrichtext" content="1" /></head><body DEFANGED_style="font-size:12pt;font-family:Bitstream Vera Sans">
<p>Hi, well, I've added some new features to the script.</p>
<p>First, I've fixed the line number problems, although there are some highline numbers that may seem not quite correct, but I'm going to rewrite the check_unlock() function if Dave don't mind me doing it, Dave? Anyway, except in some special cases the number lines are OK.</p>
<p></p>
<p>Now the script is presented with three options, --includes --nospinlocks --nomodules, the --includes allows to check the include files inside the source code, both types of include files, locals #include &quot;foo.h&quot; and referred to the /lib/modules/`uname -r`/build/include tree (the default it's not to process include files) , --nospinlocks allows to avoid the check on spin_* functions, I've added this so if someone wants to avoid the checks for whatever reason, they can, at least until I rewrite this, of course the default it's to check for spinlocks. The --nomodules option came to mind cause Randy pointed that not all files are supposed to be modules, so I've added this option that by now it only restricts the module_init mechanism and the MODULE_AUTHOR/MODULE_DESC, etc, parts, I expect to add some more 'only per modules' checks in the days coming, that's why this option comes handy.</p>
<p></p>
<p>The foo comment was changed as Randy suggested, completely right, and now it's different the way in which the script handles files, so, there's no problem with line numbers stacking between files.</p>
<p></p>
<p>Randy, the comments should be skipped, I've tried with string.c and it didn't show me any comments, care to check with this one instead? I'm only checking for this kind of comments /* ... */ and multiple lines </p>
<p>/* bar				/*						/*</p>
<p> * foo		or		 	foo		or even			foo */</p>
<p>*/					*/</p>
<p>but I'm not checking C++ style comments, like, //, which I'm going to add soon cause apparently there's a lot of people that use that style, shouldn't that be in the CodingStyles?</p>
<p>I've fixed the problem with return ERR(-EBUSY); and that kind of return codes, now you can return anything as long as it's not return ESOMETHING, or return &lt;tab&gt;EFOO; or whatever that may be similar.</p>
<p></p>
<p>You may see some code like this:</p>
<p><span DEFANGED_style="font-weight:600">Unmatched ) in regex; marked by &lt;-- HERE in m/spin_unlock.*) &lt;-- HERE </span></p>
<p><span DEFANGED_style="font-weight:600">  inside ipc_lock_by_ptr(/ at /home/rddunlap/scripts/kj-devel-vic2.pl </span></p>
<p><span DEFANGED_style="font-weight:600">line 61</span></p>
<p></p>
<p>This code comes from the fact that there are several similar calls to spinlocks, but sometimes it's not a call, it's a declaration, and instead of having a spinlock_t inside the ( ), being a declaration, it has a datatype inside, and perl has two problems with this, if it has a data type, it's not a function call but a declaration, so It would not match anything related (like an unlock function, because it's not a call), and the second problem, if it's a declaration, we found not only types in it, but also more ()) ())( and that makes the regex engine mad!, so, that's gonna dissapear as soon as I rewrite the spinlock checking code, again, if Dave allows me to.</p>
<p></p>
<p>I'm not using diff's because the code is small, and I would have to diff from the original devel.pl in the kerneljanitors page. Tell me if it's easier this way, or the other way, thank you.</p>
<p></p>
<p>Vicente.</p>
</body></html>
------------=_1108074469-32306-609--

--Boundary-00=_RW7CCI9pb6bE7SB
Content-Type: application/x-perl;
  name="kj-devel.pl"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="kj-devel.pl"

#!/usr/bin/perl -w
#
# An automated kernel janitor.
# (c) 2001, Dave Jones. <davej@suse.de>, with invaluable
# perl assistance from Rob Andrews <nine@impure.org.uk>
# Various code also inspired from hundreds of other perl scripts.
#
# Additional functionality added by The kerneljanitors.org team :)
#
# Licensed under the terms of the GNU GPL License version 2
#
# $Id: kj-devel.pl,v 1.3 2004/04/22 21:44:15 randy Exp $
#
# 1.0 Initial version.
# 1.1 Spinlock balancing checker improved.
#

use strict;
use Getopt::Long;

my @lines;
my $linesinfile=0;
my $module;		#flag, mantains the module_init/_exit
my $comment = 0;

my ($includes, $nospinlocks, $nomodules, $pathinclude);
my $linenr;
my %filenames = ();
my @archs = @ARGV;
my $include;
chomp($pathinclude = `uname -r`);


die "./$0 <--includes> <--nospinlocks> <--nomodules> <file1 file2 file...> 
	--includes		Checks inside the #include files
	--nospinlocks		Don't Check spinlocks, default is yes
	--nomodules		In case you're not building a module
	file1 file2 ...		The files you want to check\n" unless @ARGV > 0;

GetOptions("includes"	=> \$includes,
	"nospinlocks"	=> \$nospinlocks,
	"nomodules"	=> \$nomodules);

if ($includes) {
	shift @archs;
}
if ($nospinlocks) {
	shift @archs;
}
if ($nomodules) {
	shift @archs;
}

#Here's where everything starts
loader();

sub loader {
	foreach my $filename (@archs) {
		open(FILE, "<$filename") or "Unable to open $filename $!" and next;
		while(<FILE>) {
			#Add the includes files if the --includes option is given
			if ($includes and $_ =~ /#include[ |\t]?([<|"])([^(>|")]*)/) {
				if ($1 eq "\"") {
					$include = giveLocal($filename, $2);

				} else {
					$include = "/lib/modules/$pathinclude/build/include/$2";
				}
				#Check if the file isn't already there, if it's not, push it
				if (not exists($filenames{$include})) {
					push @archs, $include;
				}
			}
	
			#Push the lines of each file inside the array of that file in the hash
			push @{$filenames{$filename}}, $_;
		}
		close(FILE);
	}
	process();
}

sub check_pci_enable_device {
	my ($used, $filename) = @_;
	my $currentlinenr;
	foreach my $current (@lines) {
		if ($current=~/pci_enable_device/) {
			if ($currentlinenr < $used) {
				print "Should be ok, called on line $currentlinenr\n";
				print "$filename:$currentlinenr:$current\n";
				return;
			}
		}
		$currentlinenr++;
	}
}


sub check_unlock {
	my ($lockname, $filename, $locklinenr, $unlockregexp) = @_;

	foreach my $linenr ($locklinenr..$linesinfile) {
		#This code skips comments.
		next if ($lines[$linenr]=~/(^|\s+)\/\*.*\*\//);
		$comment = 1 if ($lines[$linenr]=~/(^|\s+)\/\*/);
		if ($comment) {
			$comment = 0 if ($lines[$linenr]=~/\*\//);
			next;
		}

		if ($lines[$linenr]=~/$unlockregexp.*$lockname/) {
			print "Lock closed on line ".($linenr+1)."\n";
			return 1;
		}

		if ($lines[$linenr]=~/return/) {
			return 0;
		}
	}
	return 0;
}


sub process {
	my $comment = 0;
	my $spinlockwarn=0;
	my $lookspci=0;
	my $drvdata; 	#this allow to check MODULE_ macros

	foreach my $filename (@archs) {
		$linenr = 1;
		$linesinfile = $#{$filenames{$filename}}+1;

		#This is dirty, but just in order to keep check_* working
		#until I clean those too.
		@lines = @{$filenames{$filename}};

		print "\n" . "x"x15 . "  $filename  " . "x"x15 ."\n\n";
		foreach my $line (@{$filenames{$filename}}) {
			$drvdata = 4;
	
			#This code skips comments.
			if ($line=~/(^|\s+)\/\*.*\*\//) {
				$linenr++;
				next;
			}
			$comment = 1 if ($line=~/(^|\s+)\/\*/);
			if ($comment) {
				$comment = 0 if ($line=~/\*\//);
				$linenr++;
				next;
			}
			chomp($line);
	
	
			if ($line=~/static const char.*__initdata/) {
				print "const & __initdata in string def. Remove const.\n";
				print "$filename:$linenr:$line\n\n";
			}
	
			if ($line=~/\(struct netdev_private \*\)/) {
				print "Unnecessary cast.\n";
				print "$filename:$linenr:$line\n\n";
			}
	
			if ($line=~/netif_rx/) {
				print "Net drivers should set dev->last_rx immediately after netif_rx\n";
				print "Also make sure the skb isn't referenced after giving it to netif_rx\n";
				print "$filename:$linenr:$line\n\n";
			}
	
			if ($line=~/(GET|MOD_(INC|DEC))_USE_COUNT/) {
				print "MOD_{INC,DEC}_USE_COUNT and GET_USE_COUNT are deprecated for 2.6: see the module-init-tools FAQ\n";
				print "$filename:$linenr:$line\n\n";
			}
	
			if ($line=~/SET_MODULE_OWNER/) {
				print "SET_MODULE_OWNER is useless for 2.6: see the module-init-tools FAQ\n";
				print "$filename:$linenr:$line\n\n";
			}
	
			if ($line=~/sleep_on/) {
				print "Using sleep_on derivative, is racy. consider using wait_event instead\n";
				print "$filename:$linenr:$line\n\n";
			}
	
			if ($line=~/check_region/) {
				print "Using check_region, is racy, use just request_region and check for its return.\n";
				print "$filename:$linenr:$line\n\n";
			}
	
			if ($line=~/check_mem_region/) {
				print "Using check_mem_region, is racy, use just request_mem_region and check for its return.\n";
				print "$filename:$linenr:$line\n\n";
			}
				
			if ($line=~/pdev-\>irq/) {
				print "Make sure pci_enable_device before reading irq\n";
				check_pci_enable_device($linenr, $filename);
				print "$filename:$linenr:$line\n\n";
			}
	
			if (($lookspci==0) and ($line=~/pci_/)) {
				$lookspci=1;
				print "Looks like a PCI driver. Make sure it uses pci_enable_device.\n";
				check_pci_enable_device($linenr, $filename);
				print "$filename:$linenr:$line\n\n";
			}
	
			if ($line=~/pdev-\>resource/) {
				print "Make sure pci_enable_device --before-- reading resource\n";
				check_pci_enable_device($linenr, $filename);
				print "$filename:$linenr:$line\n\n";
			}
	
			if ($line=~/pcibios_/) {
				print "Uses obsolete pcibios_xxx functions.\n";
				print "$filename:$linenr:$line\n\n";
			}
	
			if ($line=~/save_flags_cli/) {
				print "Use local_irq_save instead.\n";
				print "$filename:$linenr:$line\n\n";
			}
	
			if ($line=~/isa_{read,write}{b,w,l}/) {
				print "Use ioremap instead of isa_read/write functions.\n";
				print "$filename:$linenr:$line\n\n";
			}
	
			if ($line=~/current-\>state/) {
				print "Bad. Should use set_current_state.\n";
				print "$filename:$linenr:$line\n\n";
			}
	
	
			if ($line=~/loops_per_sec/) {
				print "Warning: loops_per_sec may change..\n";
				print "$filename:$linenr:$line\n\n";
			}
	
			if ($line=~/if.*dev-\>mem_start/) {
				if (($line!~/0xffffffff/) or ($line!~/-1/)) {
					print "Should check for 0xffffffff too.\n";
					print "$filename:$linenr:$line\n\n";
				}
			}
	
			if (($spinlockwarn==0) and
				(($line=~/cli\(\)/) or
				 ($line=~/sti\(\)/) or
				 ($line=~/lock_kernel/))){
				$spinlockwarn=1;
				print "Consider using spinlocks.\n";
				print "$filename:$linenr:$line\n\n";
			}
	
			if ($line=~/return( |\t)*E[^(]*$/) {
				print "Should be return -E ?";
				print "$filename:$linenr:$line\n\n";
			}
	
			if ($line=~/spin_lock\((.*)\)/) {
				if (!$nospinlocks and check_unlock($1, $filename, $linenr, "spin_unlock") == 0) {
					print "Obtained spinlock on line $linenr, but never unlocked.\n";
					print "$filename:$linenr:$line\n\n";
				}
			}
			if ($line=~/spin_lock_irqsave\((.*)\)/) {
				if (!$nospinlocks and check_unlock($1, $filename, $linenr, "spin_unlock_irqrestore") == 0) {
					print "Obtained spinlock on line $linenr, but never unlocked.\n";
					print "$filename:$linenr:$line\n\n";
				}
			}
			if ($line=~/spin_lock_bh\((.*)\)/) {
				if (!$nospinlocks and check_unlock($1, $filename, $linenr, "spin_unlock_bh") == 0) {
					print "Obtained spinlock on line $linenr, but never unlocked.\n";
					print "$filename:$linenr:$line\n\n";
				}
			}
	
			#Here are the new ones
			if ($line=~/panic\((.*)\)/) {
				print "Device Drivers as a general rule should not call panic().\n";
				print "$filename:$linenr:$line\n\n";
			}
			if ($line=~/save_flags(_cli)?\(\)/ or $line=~/restore_flags\(\)/) {
				print "save_flags_* and restore flags should not be used.\n";
				print "$filename:$linenr:$line\n\n";
			}
			if ($line=~/module_init\((.*)\)/ or $line=~/module_exit\((.*)\)/) {
				$module = 1;
			}
			if ($line=~/MODULE_AUTHOR\(.*\)/ or
				$line=~/MODULE_LICENSE\(.*\)/ or
				$line=~/SUPPORTED_DEVICE\(.*\)/ or
				$line=~/MODULE_DESCRIPTION\(.*\)/) {
				$drvdata--;
			}
			if ($line=~/MODULE_PARM\(.*\)/) {
				print "MODULE_PARM() has been replaced by module_param(name, type, perm).\n";
				print "$filename:$linenr:$line\n\n";
			}
			if ($line=~/^#.*__SMP__/) {
				print "__SMP__ is no longer used and it's going to dissapear soon.\n";
				print "$filename:$linenr:$line\n\n";
			}
			if ($line=~/strtok\(.*\)/) {
				print "strtok() is racy on smp, use strsep() instead.\n";
				print "$filename:$linenr:$line\n\n";
			}
			if ($line=~/int 0x80/) {
				print "Device Drivers should never use syscalls.\n";
				print "$filename:$linenr:$line\n\n";
			}
			if ($line=~/\bproc_register\(.*\)/) {
				print "proc_register() should be replaced with create_proc_entry().\n";
				print "$filename:$linenr:$line\n\n";
			}
			if ($line=~/(const )?char ?\* ?\w+ ?= ?\".*\"/) {
				print "Using foo[] it's recommended over *foo: saves memory references & code\n";
				print "$filename:$linenr:$line\n\n";
			}
			$linenr++;
		}
		if (!$nomodules and !defined($module)) {
			print "If you're building a module, be concious that you must use the". 
				" init mechanism, module_init() and module_exit().\n";
		}
		if (!$nomodules and $drvdata) {
			print "MODULE_AUTHOR/MODULE_LICENSE/SUPPORTED_DEVICE/MODULE_DESCRIPTION". 
				" are now required.\n";
		}
	
	}
	return 1;
}

#Returns the name of a local file given from an #include ""
#1st parm:the actual file being processed
#2nd parm:The file being included by include ""
sub giveLocal {
	my ($include, $local) = @_;
	$include = reverse($include);
	my ($name, $path) = split(/\//, $include, 2);
	return reverse($path)."/$local";
}

--Boundary-00=_RW7CCI9pb6bE7SB
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_RW7CCI9pb6bE7SB--
