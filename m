From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Date: Mon, 12 Mar 2012 06:53:16 +0000
Subject: Re: [PATCH 3/3 v2] netxen: qlogic ethernet : Fix endian bug.
Message-Id: <CAOD=uF6=2b-s_ErZ8zB+Mmo=gzE8wJdQ+h=TPz7U-sc1ucyw=Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331534303-4093-1-git-send-email-santoshprasadnayak@gmail.com>
	<20120311.234808.1919218898572322534.davem@davemloft.net>
In-Reply-To: <20120311.234808.1919218898572322534.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: David Miller <davem@davemloft.net>
Cc: sony.chacko@qlogic.com, rajesh.borundia@qlogic.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Sure David.
I will resend it with proper comment.

Regards
Santosh

On Mon, Mar 12, 2012 at 12:18 PM, David Miller <davem@davemloft.net> wrote:
> From: santosh nayak <santoshprasadnayak@gmail.com>
> Date: Mon, 12 Mar 2012 12:08:23 +0530
>
>> From: Santosh Nayak <santoshprasadnayak@gmail.com>
>>
>> Fix endian bug.
>>
>> Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
>
> This is a very non-trivial patch, therefore the terse commit
> message and the lack of any comments in this code is unacceptable.
>
> This commit message is not only terse, it's wrong. =A0You're not
> fixing an endian bug, you're fixing several of them.
>
> Explain everything in your commit message.
>
>> =A0 =A0 =A0 req.words[0] =3D cpu_to_le64(cmd);
>> - =A0 =A0 req.words[1] =3D cpu_to_le64(ip);
>> + =A0 =A0 memcpy(&req.words[1], &ip, sizeof(u32));
>
> Nobody is going to read that and have any idea why it's correct unless
> they happen to be able to discover the long thread you guys had this
> past week working out how to do this change correctly.
>
> Putting a comment here for the rest of us mere mortals is therefore
> absolutely required.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
