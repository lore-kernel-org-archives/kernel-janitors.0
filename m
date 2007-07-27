From: "Alexey Dobriyan" <adobriyan@gmail.com>
Date: Fri, 27 Jul 2007 12:07:13 +0000
Subject: Re: [PATCH 02/68] 0 -> NULL, for arch/arm
Message-Id: <b6fcc0a0707270507u1c77e093y30d9bd5bddfa9054@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707270944.LAA17082@ifs.emn.fr>
	 <20070727095905.GU27237@ftp.linux.org.uk>
	 <Pine.LNX.4.64.0707271250020.12711@fbirervta.pbzchgretzou.qr>
In-Reply-To: <Pine.LNX.4.64.0707271250020.12711@fbirervta.pbzchgretzou.qr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: Al Viro <viro@ftp.linux.org.uk>, Yoann Padioleau <padator@wanadoo.fr>, kernel-janitors@vger.kernel.org, rmk@arm.linux.org.uk, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

On 7/27/07, Jan Engelhardt <jengelh@computergmbh.de> wrote:
>
> On Jul 27 2007 10:59, Al Viro wrote:
> >On Fri, Jul 27, 2007 at 11:44:07AM +0200, Yoann Padioleau wrote:
> >>  		buf = alloc_safe_buffer(device_info, ptr, size, dir);
> >> -		if (buf = 0) {
> >> +		if (buf = NULL) {
> >
> >		if (!buf)
> >surely...
>
> Makes it look like it's used as a bool.

bool variables are rarely named buf, so no.
