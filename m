From: Benoit Taine <benoit.taine@lip6.fr>
Date: Fri, 18 Jul 2014 14:46:21 +0000
Subject: Re: How to automate checkpatch && get_maintainers && git send-email of commits range?
Message-Id: <20140718144621.GA12871@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CANZNk81LiTM9vY0dRV=T0BCT9k-BxU45Ojw_PyOcpdmtXHKM2Q@mail.gmail.com>
In-Reply-To: <CANZNk81LiTM9vY0dRV=T0BCT9k-BxU45Ojw_PyOcpdmtXHKM2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: kernelnewbies@kernelnewbies.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 18/07/2014 17:38, Andrey Utkin wrote:
> Is there script for automated checkpatch.pl && get_maintainers.pl &&
> git send-email for range of commits? I see none. Would it be welcome
> to submit such one to kernel tree?

You can use `splitpatch` to split a patch into multiple mails with the
correct mailing list and maintainers. It generates a script to
chain-send these emails using `cocci-send-email` (a modified version of
`git-send-email`).

Both are available in the `tools/` directory of coccinelle's
distribution <http://coccinelle.lip6.fr/>.

--=20
Beno=C3=AEt Taine
Master cycle intern
Regal Team. LIP6
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
