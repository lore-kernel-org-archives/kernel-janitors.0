From: Dan Carpenter <error27@gmail.com>
Date: Thu, 22 Apr 2010 09:22:42 +0000
Subject: Re: [patch] logfs: testing the wrong variable
Message-Id: <20100422092242.GH29647@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100421103354.GF29647@bicker>
In-Reply-To: <20100421103354.GF29647@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, Apr 21, 2010 at 03:15:22PM +0200, J=F6rn Engel wrote:

> Did you use a tool to find this?  And if yes, where would I find it? ;)
>=20

This is smatch stuff (http://smatch.sf.net).

The problem is that it's a private modification where I made it print=20
errors if we pass an ERR_PTR to a function.  After I send out 10 patches=20
today that modification will only print false positives... Normally the=20
false positives are cases where the function accepts ERR_PTRs as a=20
paramater.  I need to kill most of the false positives before I can push=20
the change.

The good thing about Smatch is that it's easy to compile, but the bad
thing is that it's false positive heavy.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
