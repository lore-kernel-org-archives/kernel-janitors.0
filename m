From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Date: Wed, 20 Jun 2012 08:11:21 +0000
Subject: Re: [PATCH] netxen: Error return off by one in 'netxen_nic_set_pauseparam()'.
Message-Id: <CAOD=uF6Oe1KZqmtUpY57u9GJh9BqxoK0DP0n4yP_DrMUjfXbCQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1340177259-14083-1-git-send-email-santoshprasadnayak@gmail.com>
	<20120620074447.GS4400@mwanda>
In-Reply-To: <20120620074447.GS4400@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, rajesh.borundia@qlogic.com
Cc: sony.chacko@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jun 20, 2012 at 1:14 PM, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
> On Wed, Jun 20, 2012 at 12:57:39PM +0530, santosh nayak wrote:
>> From: Santosh Nayak <santoshprasadnayak@gmail.com>
>>
>> There are 'NETXEN_NIU_MAX_GBE_PORTS' =A0GBE ports. Port indexing starts
>> from zero.
>> Hence we should also return error for "port =3D NETXEN_NIU_MAX_GBE_PORTS"
>>
>
> I don't know this code well enough to say if you are right or not,
> but what about for port =3D NETXEN_NIU_MAX_XG_PORTS a few lines later
> in both functions?


I think "for port =3D NETXEN_NIU_MAX_XG_PORTS"  error should be returned.


@Rajesh,

Can you please comment on it ?


regards
santosh

>
> regards,
> dan carpenter
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
