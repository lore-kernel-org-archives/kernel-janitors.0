From: Vicente Feito <vicente.feito@gmail.com>
Date: Fri, 04 Feb 2005 12:15:01 +0000
Subject: [KJ] updated kj-devel.pl
Message-Id: <200502041215.01436.vicente.feito@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary_(ID_5cOXfdStdXAgomZ40Rq83g)"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Boundary_(ID_5cOXfdStdXAgomZ40Rq83g)
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline

According to the kj-devel.pl modified script I've sent (which I guess not much 
people must be using).
I've removed the strlen and sprintf warning cause it's ok to use them, 
amazingly the DO and DONT's document in kerneljanitors.org says that it's not 
correct, but checking the linux/Documentation/cli_sti_removal.txt file I've 
found that it's ok to use it, I've tried contacting the author of the 
document with no luck yet.
Thank you.
PS: I'm not sending patches because this is not the official devel.pl that 
it's on the janitors page. I would like to hear if someone is using it, or 
everybody is using the other tools.

Regards.
Vicente.

--Boundary_(ID_5cOXfdStdXAgomZ40Rq83g)
Content-type: application/x-perl; name=kj-devel.pl
Content-transfer-encoding: 7BIT
Content-disposition: attachment; filename=kj-devel.pl

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

my @lines;
my $linesinfile=0;
my $module;		#flag, mantains the module_init/_exit
my $drvdata = 3; 	#this allow to check MODULE_ macros
my $comment = 0;

foreach my $file (@ARGV) {
	process ($file)
			or warn "Couldn't check file $file: $!";
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
			print ("Lock closed on line $linenr\n");
			return 1;
		}

		if ($lines[$linenr]=~/return/) {
			return 0;
		}
	}
}


sub process {
	my $filename=shift;

	return undef unless $filename;

	open(INPUT, "<$filename") or return undef;

	push @lines, <INPUT>;
	$linesinfile += @lines;

	close(INPUT);		

#	s!/\*(.*?)\*/!"\n" x (@lines =~ tr/\n//)!esg;

my $spinlockwarn=0;
my $lookspci=0;
my $linenr=0;

	foreach my $line (@lines) {

		$linenr++;

# For later, we may need to preprocess include files.
# read as: Include them into the array before the current file.
#		if ($line=~/^#include ?[<"](.*)[>"]/i) {

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

		if ($line=~/return E/) {
			print "Should be return -E ?";
			print "$filename:$linenr:$line\n\n";
		}

		if ($line=~/spin_lock\((.*)\)/) {
			if (check_unlock($1, $filename, $linenr, "spin_unlock") == 0) {
				print "Obtained spinlock on line $linenr, but never unlocked.\n";
				print "$filename:$linenr:$line\n\n";
			}
		}
		if ($line=~/spin_lock_irqsave\((.*)\)/) {
			if (check_unlock($1, $filename, $linenr, "spin_unlock_irqrestore") == 0) {
				print "Obtained spinlock on line $linenr, but never unlocked.\n";
				print "$filename:$linenr:$line\n\n";
			}
		}
		if ($line=~/spin_lock_bh\((.*)\)/) {
			if (check_unlock($1, $filename, $linenr, "spin_unlock_bh") == 0) {
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
			$line=~/SUPPORTED_DEVICE\(.*\)/) {
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
			print "Using foo[] it's recommended against *foo\n";
			print "$filename:$linenr:$line\n\n";
		}
	}
	if (!defined($module)) {
		print "You must use the init mechanism, module_init() and module_exit().\n";
	}
	if ($drvdata) {
		print "MODULE_AUTHOR/MODULE_LICENSE/MODULE_DESC are now required.\n";
	}
	
	return 1;
}

--Boundary_(ID_5cOXfdStdXAgomZ40Rq83g)
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary_(ID_5cOXfdStdXAgomZ40Rq83g)--
