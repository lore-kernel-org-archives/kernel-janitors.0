From: "David S. Miller" <davem@davemloft.net>
Date: Thu, 18 Nov 2004 00:23:02 +0000
Subject: Re: [KJ] [PATCH] driver/net/tg3.c: some s/int/unsigned int
Message-Id: <20041117162302.116dfb38.davem@davemloft.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20735652513324365=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041102101835.GA4083@voyager>
In-Reply-To: <20041102101835.GA4083@voyager>
To: kernel-janitors@vger.kernel.org

--===============20735652513324365==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 12 Nov 2004 16:13:45 +0100
Carlo Perassi <carlo@linux.it> wrote:

> I read the old patch: limit in tg3_bmcr_reset and tg3_wait_macro_done
> was not defined as unsigned.
> Anyway I compiled and tested this new patch.

I'm sorry for being such a pest, but this patch still
does add new bugs to the driver.  Even the first hunk.

That first hunk changes "loops" to be unsigned in
tg3_readphy().

The loop and error control logic is:

	loops = LOOPS_INIT;
	while (loops-- > 0) {
		..
	}
	..
	if (loops > 0)
		success path

With a signed value of loops, the success path check
will not pass when the loop exits due to the while()
check.

But with an unsigned value what happens is:

1) while (loops-- > 0) passes because loops starts
   at '1', but this decrement brings it down to
   zero, the loop executes

2) while (loops-- > 0) fails because loops starts
   at '0', and this decrement changes loops to
   a _VERY LARGE_ unsigned number.

3) if (loops > 0) passes erroneously.

We've been back and forth at least 3 times now on this
patch wrt. loop termination issues in error paths.  I
really don't see any real value in dorking with the
signnedness of these integers especially since after 3
round-trips this "cleanup" still introduces new bugs.

--===============20735652513324365==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20735652513324365==--
