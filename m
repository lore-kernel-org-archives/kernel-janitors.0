From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Mon, 29 May 2006 16:58:50 +0000
Subject: Re: [KJ] [PATCH] Storage class should be first
Message-Id: <20060529095850.cd5083c5.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060528165759.GA1614@neon.tklauser.home>
In-Reply-To: <20060528165759.GA1614@neon.tklauser.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 28 May 2006 13:18:07 -0500 dan ost wrote:

> On 5/28/06, Tobias Klauser <tklauser@nuerscht.ch> wrote:
> > Storage class should be before const
> 
> Is this a requirement of C that gcc is forgiving of or is this
> just good practice?

Yes to both.  It's deprecated ("obsolescent").

C99 spec, section 6.11.5:

6.11.5 Storage-class specifiers
The placement of a storage-class specifier other than at the
beginning of the declaration specifiers in a declaration is an
obsolescent feature.


---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
