From: "David Laight" <David.Laight@ACULAB.COM>
Date: Mon, 12 Mar 2012 09:37:47 +0000
Subject: RE: [PATCH 3/3] netxen: qlogic ethernet : Fix Endian Bug.
Message-Id: <AE90C24D6B3A694183C094C60CF0A2F6026B6E99@saturn3.aculab.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <CAOD=uF4Vx581zvpAT0dHKjUkrdsiZo-DTNR352V8tALM_P2roA@mail.gmail.com>
References: <1330701099-18281-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1330701099-18281-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santosh prasad nayak <santoshprasadnayak@gmail.com>, Rajesh Borundia <rajesh.borundia@qlogic.com>
Cc: Sony Chacko <sony.chacko@qlogic.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

 

> -----Original Message-----
> From: netdev-owner@vger.kernel.org 
> [mailto:netdev-owner@vger.kernel.org] On Behalf Of santosh 
> prasad nayak
> Sent: 11 March 2012 09:17
> To: Rajesh Borundia
> Cc: Sony Chacko; netdev; linux-kernel; kernel-janitors@vger.kernel.org
> Subject: Re: [PATCH 3/3] netxen: qlogic ethernet : Fix Endian Bug.
> 
> Thanks Rajesh for clarification.
> Included all your inputs in the following patch.
> This is for review not a formal one. Once review is done I will send a
> formal patch.

I'm not sure of the exact nature of the issues here,
but whenever I see code that casts between the addresses
of integer types large bells start ringing - such code
tends to have unwanted dependencies against the sizes
and endiannesses of the relevant fields.
This code might be ok, but lines like:
> +	if (*(__le64 *)mac = cpu_to_le64(~0ULL)) {
rather give me the willies.

	David


