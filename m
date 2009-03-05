From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 05 Mar 2009 23:04:49 +0000
Subject: Re: [PATCH v2 15/15] NULL noise: mm/memcontrol.c
Message-Id: <154e089b0903051504v451f2421jae561c58984946ad@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
	 <20090305191839.30062.91081.stgit@f10box.hanneseder.net>
	 <20090305144210.e40ef501.akpm@linux-foundation.org>
In-Reply-To: <20090305144210.e40ef501.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Andrew Morton <akpm@linux-foundation.org>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, kamezawa.hiroyu@jp.fujitsu.com

On Thu, Mar 5, 2009 at 11:42 PM, Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Thu, 05 Mar 2009 20:18:44 +0100
> Hannes Eder <hannes@hanneseder.net> wrote:
>
>> Fix this sparse warning:
>> =A0 mm/memcontrol.c:1637:32: warning: Using plain integer as NULL pointer
>>
>> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
>> Acked-by: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
>> ---
>> v2: other subject, as suggested by Al Viro
>>
>> =A0mm/memcontrol.c | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
>> index 8e4be9c..09d6650 100644
>> --- a/mm/memcontrol.c
>> +++ b/mm/memcontrol.c
>> @@ -1634,7 +1634,7 @@ static int mem_cgroup_force_empty_list(struct mem_=
cgroup *mem,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 pc =3D list_entry(list->prev, struct page_cg=
roup, lru);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (busy =3D pc) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 list_move(&pc->lru, list);
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 busy =3D 0;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 busy =3D NULL;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&zone=
->lru_lock, flags);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>
> I have to say that I wish sparse didn't do this. =A0Initialising a
> pointer with literal zero is perfectly clear and is idiomatic C.

We could turn it off with '-Wno-non-pointer-null', but then it is not
reported in other might useful cases either. Well, it's really a minor
thing, but fixing it, isn't a big deal either. Or is there any
drawback that I am not aware of?
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
