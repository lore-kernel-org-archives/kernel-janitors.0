From: burns.ethan@gmail.com
Date: Tue, 27 Feb 2007 16:31:59 +0000
Subject: Re: [KJ] [PATCH] 3c505.c: replacing strcpy to strncpy
Message-Id: <20070227163159.GA20253@bender.eaburns.mooo.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070225173528.GB3595@localhost.localdomain>
In-Reply-To: <20070225173528.GB3595@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Feb 27, 2007 at 10:07:43AM +0100, Bernhard R. Link wrote:
> Replacing a strcpy with a strncpy usually makes code more buggy than
> it was before, as strncpy does not generate 0-terminated strings when
> the input is too long. (Unless the kernel names something strncpy
> which is no strncpy, I've no kernel source unpackages around, but I
> doubt that). Even if the output is 0-terminated, simply truncating it
> can be a security problem in some cases. (And a problem in most cases)
>
> strcpy is good if you are sure something fits in the destination. If
> not, you should test before and if it fits not, give an appropiate
> response, either truncate where it is save, or simply fail. (And when
> you tested its length and still have that around, you need no strcpy or
> strncpy but a memcpy can be used, making it even faster on some arches).
>
> So I'd rather suggest looking for strncpy and checking those. I don't
> know what the state of strncpy in the kernel is, but in an avarage
> project strncpy usage typically means a bug.

Looks like strlcpy() would solve both these problems.  It guarentees that the
destination string is null terminated and it returns the strlen() of the
source string:

	ssize = strlcpy(dest, src, dsize);
	if (ssize >= dsize - 1)
		return ERROR;

Here we have dest guarenteed to be terminated, and if the source string is
greater than the dest - 1 (for the '\0'), we can bail out.

		--Ethan
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
