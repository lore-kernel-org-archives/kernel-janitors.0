From: "David S. Miller" <davem@davemloft.net>
Date: Wed, 03 Nov 2004 23:59:30 +0000
Subject: Re: [KJ] [PATCH] driver/net/tg3.c: some s/int/unsigned int
Message-Id: <20041103155930.6cd0e0bf.davem@davemloft.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30332372835640053=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041102101835.GA4083@voyager>
In-Reply-To: <20041102101835.GA4083@voyager>
To: kernel-janitors@vger.kernel.org

--===============30332372835640053==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 3 Nov 2004 11:37:26 +0100
Carlo Perassi <carlo@linux.it> wrote:

> compiled and tested

Did you test with one of these hardware polling loops
actually timing out?  I bet the new version wouldn't
work properly.

The 'limit' variables need to be signed, because the
loops are coded like this:

	int limit = 100;

	while (limit--) {
		...
	}
	if (limit <= 0)
		goto fail;

Therefore, on the last iteration, limit will still be decremented
past zero when it hits zero.  Now you've changed it to:

	unsigned int limit = 100;

	while (limit--) {
		...
	}
	if (!limit)
		goto fail;

That's not the same.  This new test will only pass if
we take (100 - 1) iterations through the loop.  It
should pass if we take 100 or more iterations through
the loop.

Actually, the existing tests are wrong and have an off-by-1
error as well, they should all be "if (limit < 0)"

--===============30332372835640053==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30332372835640053==--
