From: Rajesh Borundia <rajesh.borundia@qlogic.com>
Date: Wed, 20 Jun 2012 09:51:52 +0000
Subject: RE: [PATCH] netxen: Error return off by one in 'netxen_nic_set_pauseparam()'.
Message-Id: <13A253B3F9BEFE43B93C09CF75F63CAA81A886EF19@MNEXMB1.qlogic.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1340177259-14083-1-git-send-email-santoshprasadnayak@gmail.com>
	<20120620074447.GS4400@mwanda>,<CAOD=uF6Oe1KZqmtUpY57u9GJh9BqxoK0DP0n4yP_DrMUjfXbCQ@mail.gmail.com>
In-Reply-To: <CAOD=uF6Oe1KZqmtUpY57u9GJh9BqxoK0DP0n4yP_DrMUjfXbCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santosh prasad nayak <santoshprasadnayak@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sony Chacko <sony.chacko@qlogic.com>, netdev <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

_______________________________________
From: santosh prasad nayak [santoshprasadnayak@gmail.com]
Sent: Wednesday, June 20, 2012 1:29 PM
To: Dan Carpenter; Rajesh Borundia
Cc: Sony Chacko; netdev; kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] netxen: Error return off by one in 'netxen_nic_set_pauseparam()'.

On Wed, Jun 20, 2012 at 1:14 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Wed, Jun 20, 2012 at 12:57:39PM +0530, santosh nayak wrote:
>> From: Santosh Nayak <santoshprasadnayak@gmail.com>
>>
>> There are 'NETXEN_NIU_MAX_GBE_PORTS'  GBE ports. Port indexing starts
>> from zero.
>> Hence we should also return error for "port = NETXEN_NIU_MAX_GBE_PORTS"
>>
>
> I don't know this code well enough to say if you are right or not,
> but what about for port = NETXEN_NIU_MAX_XG_PORTS a few lines later
> in both functions?


I think "for port = NETXEN_NIU_MAX_XG_PORTS"  error should be returned.


@Rajesh,

Can you please comment on it ?


regards
santosh

>
> regards,
> dan carpenter
>

Yes error should be returned for  both port = NETXEN_NIU_MAX_XG_PORTS and
port =  NETXEN_NIU_MAX_GBE_PORTS.


Rajesh 

