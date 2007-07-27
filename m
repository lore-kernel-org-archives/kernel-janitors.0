From: Al Viro <viro@ftp.linux.org.uk>
Date: Fri, 27 Jul 2007 12:30:07 +0000
Subject: Re: [PATCH 02/68] 0 -> NULL, for arch/arm
Message-Id: <20070727123007.GY27237@ftp.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707270944.LAA17082@ifs.emn.fr> <20070727095905.GU27237@ftp.linux.org.uk> <Pine.LNX.4.64.0707271250020.12711@fbirervta.pbzchgretzou.qr> <b6fcc0a0707270507u1c77e093y30d9bd5bddfa9054@mail.gmail.com> <Pine.LNX.4.64.0707271418390.12711@fbirervta.pbzchgretzou.qr>
In-Reply-To: <Pine.LNX.4.64.0707271418390.12711@fbirervta.pbzchgretzou.qr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Yoann Padioleau <padator@wanadoo.fr>, kernel-janitors@vger.kernel.org, rmk@arm.linux.org.uk, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

On Fri, Jul 27, 2007 at 02:18:59PM +0200, Jan Engelhardt wrote:
> >bool variables are rarely named buf, so no.
> 
> Whatever. Java is good in one point: the ! operator requires a bool.

Language and style advocacy -> that way.  Use of scalar types, including
pointers, in conditional contexts is both 100% legal and, what's more
important, idiomatic C.
