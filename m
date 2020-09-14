From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 14 Sep 2020 14:57:43 +0000
Subject: Re: [PATCH] MAINTAINERS: make linux-mediatek list remarks consistent
Message-Id: <alpine.DEB.2.21.2009141615020.17999@felia>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1939471326-1600095464=:17999"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
 <f6bc41d3-5ce4-b9ea-e2bb-e0cee4de3179@gmail.com>
 <alpine.DEB.2.21.2009141208200.17999@felia>
 <9c5aaa15-bdd8-ae4f-0642-092566ab08ba@gmail.com>
 <alpine.DEB.2.21.2009141552570.17999@felia>
 <7da64c0975c345f1f45034410c9ed7d509ba9831.camel@infradead.org>
In-Reply-To: <7da64c0975c345f1f45034410c9ed7d509ba9831.camel@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Joe Perches <joe@perches.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1939471326-1600095464=:17999
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Mon, 14 Sep 2020, David Woodhouse wrote:

> On Mon, 2020-09-14 at 16:01 +0200, Lukas Bulwahn wrote:
> > > > I am not subscribed to linux-mediatek. When I sent an email to the list,
> > > > it showed up really seconds later in the lore.kernel.org of the
> > > > linux-mediatek public-inbox repository. So, either it was delivered
> > > > quickly as it is not moderated or my check with lore.kernel.org is wrong,
> > > > e.g., mails show up in the lore.kernel.org archive, even they were not
> > > > yet permitted on the actual list.
> > > > 
> > > 
> > > I'm the moderator and I get requests to moderate emails. I suppose I added you
> > > to the accepted list because of earlier emails you send.
> > > 
> > 
> > Okay, I see. I did send some clean-up patch in the past, but I completely 
> > forgot that, but my mailbox did not forget. So, now it is clear to me why 
> > that mail showed up so quickly.
> > 
> > Thanks for the explanation.
> 
> AFAICT the linux-mediatek list isn't configured to automatically
> moderate messages from non-subscribers. Its generic_nonmember_action
> setting is 'Accept'. That is the default setting for lists on
> infradead.org and I strongly encourage list maintainers to leave it
> that way.
> 
> Lukas, I don't see your address in the allowlist either.
> 
> There are other reasons why some messages get might trapped for
> moderation — the message size, number of recipients, spam score, etc.
> 
> The mere fact that *some* messages are moderated does not mean that the
> list is "moderated for non-subscribers" in the sense that the
> MAINTAINERS file lists.
>
> > Bjorn, with that confirmation and Reviewed-by from Matthias, could you 
> > please pick this patch?
> 
> I think we should be fixing the ones that *do* say it's moderated for
> non-subscribers, not the one that correctly didn't :)
> 

Well, I am happy to send any PATCH v2. I guess we, you, David, Matthias 
and I, now just need to determine if the list is moderated or not.

I will then adjust MAINTAINERS to the final conclusion.

Lukas
--8323329-1939471326-1600095464=:17999--
