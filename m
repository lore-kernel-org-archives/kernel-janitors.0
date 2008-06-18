From: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 18 Jun 2008 23:48:35 +0000
Subject: Re: [PATCH] firmware: convert tg3 driver to request_firmware()
Message-Id: <1213832915.26255.1384.camel@pmac.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1213799313.4794.20.camel@fc6.satnam>
In-Reply-To: <1213799313.4794.20.camel@fc6.satnam>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, 2008-06-18 at 16:23 -0700, David Miller wrote:
> Fair enough.
>=20
> I'll step back and let you work out the objections Jeff
> raised.

I have considered his request to do the conversion in two steps, but I
think it's misguided.

It _was_ actually my original plan, but the experience with the drivers
we've converted so far has shown that it isn't particularly feasible to
do it like that.

In just about every driver we've done so far, we've made minor changes
in the way we handle firmware when it comes from request_firmware() --
often due to the fact that what we get from request_firmware() now has a
constant endianness, instead of being a host-endian array in the source.

So we end up _changing_ the code which loads the firmware. Usually only
fairly minor changes, and in a way which can be made Obviously Correct=E2=
=84=A2,
but it _is_ changed.

And those patches are easier to review if you can just see the changes.
To first add a new code path for the request_firmware() version, and
then remove the old code path in a separate patch, just obfuscates
what's happening -- it's a bit like changing files as you rename them.
The old function disappears and the new one, subtly changed, appears.

I showed the acenic version of that earlier -- the two separate patches
are _much_ harder to read and review individually, in my view, than the
single combined patch where you can actually see what's changing.

Not only is it counter-productive from the POV of code review, it's
_also_ counter-productive from the testing POV. Because if we only merge
the first of the two patches and people report "yes, my acenic still
works in linux-next", you don't _know_ that they were using the new
request_firmware() code path. People have a tendency to ignore even the
most scary printk you can put in before you fall back to the built-in
version. They'll just tell you 'it works'.

So it's _better_ for that built-in version to be what you get with
CONFIG_TIGON3_FIRMWARE=3Dy in the patches I've sent. And then we _know_
that we're testing the new request_firmware() code path in the driver
and that our testing is _meaningful_.

Doing it two separate patches is just pointless and counter-productive
churn; really.

--=20
dwmw2

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
