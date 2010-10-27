From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Date: Wed, 27 Oct 2010 01:24:50 +0000
Subject: Re: [ibm-acpi-devel] [PATCH 8/14]
Message-Id: <20101027012450.GB29299@khazad-dum.debian.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288088743-3725-1-git-send-email-julia@diku.dk>
 <1288088743-3725-9-git-send-email-julia@diku.dk>
 <20101027010908.GA29299@khazad-dum.debian.net>
In-Reply-To: <20101027010908.GA29299@khazad-dum.debian.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Matthew Garrett <mjg@redhat.com>

On Tue, 26 Oct 2010, Henrique de Moraes Holschuh wrote:
> On Tue, 26 Oct 2010, Julia Lawall wrote:
> > From: Julia Lawall <julia@diku.dk>
> > 
> > Delete successive assignments to the same location.
> 
> There are often results of mismerges or other assorted screw ups, often
> done by the maintainer itself (e.g. me in thinkpad-acpi's case) during
> development.

Which was the case, and the error was just a duplicate line indeed and not
anything more damaging in one of my commits done a few years ago.

So,

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
