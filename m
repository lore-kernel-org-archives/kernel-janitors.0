From: Matthew Wilcox <willy@infradead.org>
Date: Thu, 02 Jul 2020 00:08:43 +0000
Subject: Re: [v2] Documentation: Coccinelle: fix typos and command example
Message-Id: <20200702000843.GV25523@casper.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0616dd0c-bb86-be2b-3dc6-1c695a92c3ca@infradead.org>
 <c2c1dec0-2bd1-b0e2-1aa4-38d0e954d5ba@web.de>
 <efc8b0c9-db3b-3c9c-d876-897b53a9e278@infradead.org>
 <2a3940de-6a81-1aff-8109-53c1c5a6aa1b@web.de>
 <f2aaa91a-f935-bc2d-26f2-712576c1bbd7@infradead.org>
 <2f80fb10-dc7f-29be-dc3e-2715f8bafc6d@web.de>
 <dfa2ed9f-fe68-58d1-c3d0-ac436f9bee09@infradead.org>
In-Reply-To: <dfa2ed9f-fe68-58d1-c3d0-ac436f9bee09@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, Markus Elfring <Markus.Elfring@web.de>, Coccinelle <cocci@systeme.lip6.fr>

On Wed, Jul 01, 2020 at 07:52:58AM -0700, Randy Dunlap wrote:
> On 7/1/20 6:32 AM, Markus Elfring wrote:
> >>> How do you think about to use the following command variant
> >>> for the adjustment of the software documentation?
> >>>
> >>> +    make C=1 CHECK='scripts/coccicheck' 'path/to/file.o'
> >>
> >> I don't understand the reason for that change...
> 
> IOW, your "patch" needs justification and/or explanation. It was missing that info.

What Markus is trying so completely ineptly to say is that
  make C=1 CHECK=scripts/coccicheck path/to/file.c
doesn't work.  You need to use the .o suffix to check the .c file.
