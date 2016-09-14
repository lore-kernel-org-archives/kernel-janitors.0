From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Sep 2016 06:56:35 +0000
Subject: Re: virtio_blk: Less function calls in init_vq() after error detection
Message-Id: <8b4106e0-8523-56b6-94ef-b7add020497a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <02054675-8395-ac81-6863-e3a5cbfc9032@users.sourceforge.net>
 <f56845a8-03c6-d3f7-6091-99dba9835780@users.sourceforge.net>
 <e918e655-cd86-c3c8-d911-9dfc03b03e19@de.ibm.com>
 <7da823eb-939c-9ee6-32bf-db296e6a96f6@users.sourceforge.net>
 <44fd46f6-441a-d497-9157-7e2a0f3f45da@de.ibm.com>
In-Reply-To: <44fd46f6-441a-d497-9157-7e2a0f3f45da@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Christian_Borntr=c3=a4ger?= <borntraeger@de.ibm.com>, virtualization@lists.linux-foundation.org, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Minfei Huang <minfei.hmf@alibaba-inc.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Chao Fan <fanc.fnst@cn.fujitsu.com>

>>    How much will it matter in general that two function calls are perfor=
med
>>    in this use case without checking their return values immediately?
>>    https://cwe.mitre.org/data/definitions/252.html
>>
>> 	if (!names || !callbacks || !vqs) { =E2=80=A6
>>
>>    https://cwe.mitre.org/data/definitions/754.html
>=20
> The return values are checked,

I agree to this information.


> just a bit later.

I suggest to reconsider this design detail if it is really acceptable
for the safe implementation of such a software module.


> Markus, kernel patches are not about be formally correct vs. CodingStyle =
and/or checkpatch

I guess that some of the involved technical advices will also matter here, =
don't they?


> or against code guidelines from sombody else.

Some ideas or advices are integrated from other information sources also in=
to various
Linux software.


> You will find many people consider gotos an no-go,

I became trained also in this design direction for a while.


> still it is accepted in the kernel for good reasons.

I can follow such reasons to some degree.


> You have to think about each change and its tradeoffs (e.g simplicity vs.=
 performance)=20
> for each code part again.

This can happen as usual for an ordinary source code review process.
I would be interested to clarify if items could be optimised for repeated c=
hecks
in this work flow.


> Here we have slow path error handling, so given the low coverage of these=
 code parts,

Would you like to add any other background information for this aspect?


> simplicity is important.

I can follow this opinion to some degree.


> Yes, your code makes an unlikely error case bail out faster,

Is this kind of functionality desired finally?


> but is the cost of your patch (review time, danger of adding bugs, danger=
 of merge conflicts,
> making git blame less useful) in sync with the expected win?

I hope so.

Do the mentioned aspects express a fear or other general concerns which hin=
der changes
and make the proposed software improvement unlikely?


> (Well, having a label between the if and the function like
>>   	if (err)
>> + free_vblk_vqs:
>>  		kfree(vblk->vqs);
>=20
> is certainly ugly in itself)

Would you find such a source code approach better if curly brackets will be
added there?


> Do you realize that your discussion style is not very helpful?

I find that this view is debatable.


> I just grepped the last LKML mails and you already pissed of several main=
tainers
> in totally different areas.

Yes. - It can happen that some contributors get occasionally grumpy.

Would you like to discuss their reasons a bit more?


> When that happens, why don't you stop for a moment
> and think about "what is going wrong right now".=20

This happened also a few times already.


> Your attitude seems to be "I spend my spare time doing this, please thank=
 me for that".

I guess that I am not so different in this aspect as I am trying to be anot=
her
respectable free software developer for years.


> The thing is, with each patch you actually request time from the maintain=
er.

This is a consequence of software development as usual.


> Now here begins the interesting part: Is the patch just a cosmetic change=
 that does
> not give you any benefit or is the patch improving the code.

How do you categorise my concrete update suggestion which builds on previou=
s contributions
by others?


> And remember: there are always tradeoffs: performance, code size, code ma=
intainability etc.

I find that I pick some of such design goals up for my software contributio=
ns already
for a while.


> See, some of your patches are accepted, e.g. the memdup_user changes have=
 usually
> been applied by most maintainers including myself.

I thank you once more that you could also accept one of the proposed specia=
l software updates.


> If maintainers won't take other change, please accept that.

It can happen that change acceptance needs to evolve over time.
Can a healthy pressure help to achieve special software improvements?


> If you continue to waste peoples time by discussing "maybe" patches

Can it be that this category of software updates has got a high potential f=
or further
clarifications because some approaches are occasionally interpreted as cont=
roversial?


> you actually risk that people will stop taking any patches from you
> including the "yes" ones.

I assume that this risk is hard to avoid. - It is a matter for each contrib=
utor
on how the desired communication should evolve further.


My knowledge evolved in the way that I am using some tools for
static source code analysis. Such advanced tools can point various
change opportunities out. I picked a few special search patterns up.
It happened then that hundreds of source files were found which contain
update candidates.


Further challenges are relevant then as usual.

* Handling of the search process and their results

* Communication between contributors


Search patterns can occasionally be categorised as "too special".
The software technology contains also the risk for showing "false positives=
".

The reactions of code reviewers are varying between agreement and rejection.


The discussed concrete (and small) patch series is just another example
for usual difficulties or more interesting software development challenges.
I hope that they can be resolved in a systematic way.

So there are further constraints to consider, aren't there?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
