From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 17 Jan 2008 15:54:36 +0000
Subject: "memset(..., 0, PAGE_SIZE)" replaceable by "clear_page()"?
Message-Id: <alpine.LFD.1.00.0801171050220.11265@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i recall a discussion about this once upon a time, but there are
numerous invocations of the form:

  memset(addr, 0, PAGE_SIZE)

for which *some* of those could probably be replaced by a call to
clear_page() instead.  just to see the possibilities:

grep -Er "memset ?\([^,]+, ?0, ?PAGE_SIZE\)" ${DIR} | grep -v "#define clear_page" .

  if someone wanted to poke around there, they're welcome to it.

rday
--

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

Home page:                                         http://crashcourse.ca
Fedora Cookbook:    http://crashcourse.ca/wiki/index.php/Fedora_Cookbook
====================================
