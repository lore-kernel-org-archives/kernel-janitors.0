From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 03 May 2012 08:17:49 +0000
Subject: Re: [PATCH] Staging: Comedi adv_pci1710: Cleaned up function check_channel_list
Message-Id: <20120503081749.GC13252@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="xHFwDpU9dbj6ez1V"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1335975217-5895-1-git-send-email-tomas.melin@iki.fi>
In-Reply-To: <1335975217-5895-1-git-send-email-tomas.melin@iki.fi>
To: kernel-janitors@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 02, 2012 at 07:13:37PM +0300, Tomas Melin wrote:
> -Simplified function logic by assuming that n_chan >1 if not <=1. Removes
> one level of indentation.
> -> readability improved and code fits into 80 chars
> - Code indentation fixes, corrected comments
> - Added braces to if() for readability
> 

Greg of course is the Boss-man and he already explained that this
needed to get broken up, but yeah I also wanted to say that as well.
The first patch should just pull the if (n_chan == 1) forward,
remove the else clause, and pull the indent level in.

When I review this stuff I have a script called rename_rev.pl
(attached) and I `cat your_patch.txt | rename_rev.pl`.  It removes
the indenting changes and only shows the logic changes.  So the
solid block of changes becomes a two liner which takes 10 seconds
to review.  The other changes to line breaks and comments and curly
parens are much simpler to review on their own.  10 seconds for
each.  It's way way easier to review one liner changes than a
tangled block of changes.

regards,
dan carpenter


--xHFwDpU9dbj6ez1V
Content-Type: text/x-perl; charset=us-ascii
Content-Disposition: attachment; filename="rename_rev.pl"

#!/usr/bin/perl

# This is a tool to help review variable rename patches. The goal is
# to strip out the automatic sed renames and the white space changes
# and leaves the interesting code changes.
#
# Example 1: A patch renames openInfo to open_info:
#     cat diff | rename_review.pl openInfo open_info
#
# Example 2: A patch swaps the first two arguments to some_func():
#     cat diff | rename_review.pl \
#                    -e 's/some_func\((.*?),(.*?),/some_func\($2, $1,/'
#
# Example 3: A patch removes the xkcd_ prefix from some but not all the
# variables.  Instead of trying to figure out which variables were renamed
# just remove the prefix from them all:
#     cat diff | rename_review.pl -ea 's/xkcd_//g'
#
# Example 4: A patch renames 20 CamelCase variables.  To review this let's
# just ignore all case changes and all '_' chars.
#     cat diff | rename_review -ea 'tr/[A-Z]/[a-z]/' -ea 's/_//g'
#
# The other arguments are:
# -nc removes comments
# -ns removes '\' chars if they are at the end of the line.

use strict;
use File::Temp qw/ :mktemp  /;

sub usage() {
    print "usage: cat diff | $0 old new old new old new...\n";
    print "   or: cat diff | $0 -e 's/old/new/g'\n";
    print " -e : execute on old lines\n";
    print " -ea: execute on all lines\n";
    print " -nc: no comments\n";
    print " -nb: no unneeded braces\n";
    print " -ns: no slashes at the end of a line\n";
    exit(1);
}
my @subs;
my @cmds;
my $strip_comments;
my $strip_braces;
my $strip_slashes;

sub filter($) {
    my $_ = shift();
    my $old = 0;
    if ($_ =~ /^-/) {
        $old = 1;
    }
    # remove the first char
    s/^[ +-]//;
    if ($strip_comments) {
        s/\/\*.*?\*\///g;
        s/\/\/.*//;
    }
    foreach my $cmd (@cmds) {
        if ($old || $cmd->[0] =~ /^-ea$/) {
		eval $cmd->[1];
	}
    }
    foreach my $sub (@subs) {
	if ($old) {
		s/$sub->[0]/$sub->[1]/g;
	}
    }
    return $_;
}

while (my $param1 = shift()) {
    if ($param1 =~ /^-nc$/) {
        $strip_comments = 1;
        next;
    }
    if ($param1 =~ /^-nb$/) {
        $strip_braces = 1;
        next;
    }
    if ($param1 =~ /^-ns$/) {
        $strip_slashes = 1;
        next;
    }
    my $param2 = shift();
    if ($param2 =~ /^$/) {
	usage();
    }
    if ($param1 =~ /^-e(a|)$/) {
        push @cmds, [$param1, $param2];
	next;
    }
    push @subs, [$param1, $param2];
}

my ($oldfh, $oldfile) = mkstemp("/tmp/oldXXXXX");
my ($newfh, $newfile) = mkstemp("/tmp/newXXXXX");

while (<>) {
    if ($_ =~ /^(---|\+\+\+)/) {
	next;
    }
    my $output = filter($_);
    if ($_ =~ /^-/) {
	print $oldfh $output;
	next;
    }
    if ($_ =~ /^\+/) {
	print $newfh $output;
	next;
    }
    print $oldfh $output;
    print $newfh $output;
}

my $hunk;
my $old_txt;
my $new_txt;

open diff, "diff -uw $oldfile $newfile |";
while (<diff>) {
    if ($_ =~ /^(---|\+\+\+)/) {
	next;
    }

    if ($_ =~ /^@/) {
        if ($strip_comments) {
            $old_txt =~ s/\/\*.*?\*\///g;
            $new_txt =~ s/\/\*.*?\*\///g;
        }
        if ($strip_braces) {
            $old_txt =~ s/{([^;{]*?);}/$1;/g;
            $new_txt =~ s/{([^;{]*?);}/$1;/g;
	    # this is a hack because i don't know how to replace nested
	    # unneeded curly braces.
            $old_txt =~ s/{([^;{]*?);}/$1;/g;
            $new_txt =~ s/{([^;{]*?);}/$1;/g;
	}

       if ($old_txt ne $new_txt) {
 	    print $hunk;
	    print $_;
	}
	$hunk = "";
	$old_txt = "";
	$new_txt = "";
	next;
    }

    $hunk = $hunk . $_;

    if ($strip_slashes) {
	s/\\$//;
    }

    if ($_ =~ /^-/) {
	s/-//;
	s/[ \t\n]//g;
	$old_txt = $old_txt . $_;
	next;
    }
    if ($_ =~ /^\+/) {
	s/\+//;
	s/[ \t\n]//g;
	$new_txt = $new_txt . $_;
	next;
    }
    if ($_ =~ /^ /) {
	s/^ //;
	s/[ \t\n]//g;
	$old_txt = $old_txt . $_;
	$new_txt = $new_txt . $_;
    }
}
if ($old_txt ne $new_txt) {
    if ($strip_comments) {
        $old_txt =~ s/\/\*.*?\*\///g;
        $new_txt =~ s/\/\*.*?\*\///g;
    }
    if ($strip_braces) {
        $old_txt =~ s/{([^;{]*?);}/$1;/g;
        $new_txt =~ s/{([^;{]*?);}/$1;/g;
        $old_txt =~ s/{([^;{]*?);}/$1;/g;
        $new_txt =~ s/{([^;{]*?);}/$1;/g;
    }

    print $hunk;
}

unlink($oldfile);
unlink($newfile);

--xHFwDpU9dbj6ez1V--
