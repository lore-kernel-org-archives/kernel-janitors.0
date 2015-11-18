From: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 18 Nov 2015 19:31:29 +0000
Subject: Re: [PATCH 4/7] phy: rockchip-usb: add missing of_node_put
Message-Id: <20151118193129.GA48815@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1447673600-8881-1-git-send-email-Julia.Lawall@lip6.fr>
 <1447673600-8881-5-git-send-email-Julia.Lawall@lip6.fr>
 <19587543.sZ81DoLUBT@diego>
In-Reply-To: <19587543.sZ81DoLUBT@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

On Wed, Nov 18, 2015 at 08:27:07PM +0100, Heiko St=FCbner wrote:
> Am Montag, 16. November 2015, 12:33:17 schrieb Julia Lawall:
> hmm, while I agree that the rockchip phy has an issue in the node lifecyc=
le,=20
> I'm not sure that patch fixes it fully.
>=20
> It currently iterates over each phy, but would only of_node_put the phy i=
t=20
> handled last. So if an error happens on the 3rd phy, the first 2 are alre=
ady=20
> instantiated and would also get removed when the overall probe fails, but=
=20
> their of_node would never be "put".

Note the behavior of of_get_next_child() (and
of_get_next_available_child()); it "Decrements the refcount of prev." So
the loop only keeps a reference for (at most) one node at a time.

I believe Julia's patch is correct. It's possible the commit description
could have made this aspect clearer though, since I was confused about
this at first as well.

Regards,
Brian
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
