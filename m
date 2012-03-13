From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Date: Tue, 13 Mar 2012 08:47:24 +0000
Subject: Re: [PATCH 3/3 v3] netxen: qlogic ethernet : Fix endian bug.
Message-Id: <CAOD=uF6e_JKaEQbFV=78JmuMBSUOtP7L0cBZr2zSv+Zgwq==qQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331624093-12598-1-git-send-email-santoshprasadnayak@gmail.com>
	<20120313.010406.769202674785007195.davem@davemloft.net>
In-Reply-To: <20120313.010406.769202674785007195.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: David Miller <davem@davemloft.net>
Cc: sony.chacko@qlogic.com, rajesh.borundia@qlogic.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

My mistake.
Normally I compile before sending the patch. This time I forgot.

Sorry for the inconvenience.


regards
Santosh

On Tue, Mar 13, 2012 at 1:34 PM, David Miller <davem@davemloft.net> wrote:
>
> You didn't even compile test this.
>
>> - =A0 =A0 if (*mac =3D cpu_to_le64(~0ULL)) {
>> + =A0 =A0 if (*mac =3D ~0ULL)) {
>
> This is unacceptable, I'm ignoring you for at least a week.
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
