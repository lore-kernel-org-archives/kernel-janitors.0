From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 05 Nov 2007 04:33:28 +0000
Subject: possible project:  removing duplicated header "#include"s
Message-Id: <Pine.LNX.4.64.0711042330070.492@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  based on a brief and animated discussion on the main LKML, a
possible project for a would-be janitor might be to remove unnecessary
duplicates of header file inclusions from both source and header
files.

  i wrote a quick script to display such things here:

http://www.crashcourse.ca/wiki/index.php/Duplicate_include_files

until adrian pointed out that you get pretty much the same output from
running the soon-to-be-documented "make includecheck".

  so if someone wants to tackle that (a section at a time, rather than
in one monstrous fell swoop, i would guess), there's a job for you.

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
