From: matt mooney <mfmooney@gmail.com>
Date: Sat, 07 May 2011 19:35:17 +0000
Subject: Re: [PATCH] net/bonding: adjust codingstyle for bond_3ad files
Message-Id: <BANLkTimKs39m_htMFEygR+3Bfu7Butc-zQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110507012717.GA15854@x61.tchesoft.com>
	<1304733100.11874.33.camel@Joe-Laptop>
	<20110507173141.GA4204@x61.tchesoft.com>
	<1304791360.1738.6.camel@Joe-Laptop>
In-Reply-To: <1304791360.1738.6.camel@Joe-Laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Joe Perches <joe@perches.com>
Cc: aquini@linux.com, kernel-janitors@vger.kernel.org, David Miller <davem@davemloft.net>, Jay Vosburgh <fubar@us.ibm.com>, Andy Gospodarek <andy@greyhouse.net>, shemminger@vyatta.com, netdev@vger.kernel.org, Nicolas Kaiser <nikai@nikai.net>

On Sat, May 7, 2011 at 11:02 AM, Joe Perches <joe@perches.com> wrote:
> On Sat, 2011-05-07 at 14:31 -0300, Rafael Aquini wrote:
>> To exemplify my point, I'll taking that very =A0__ad_timer_to_ticks() as=
 an example:
>> static u16 __ad_timer_to_ticks(u16 timer_type, u16 par)
>> {
>> =A0 =A0 =A0 =A0 u16 retval =3D 0;
>>
>> =A0 =A0 =A0 =A0 switch (timer_type) {
>> =A0 =A0 =A0 =A0 case AD_CURRENT_WHILE_TIMER: =A0 =A0/* for rx machine us=
age */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (par)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 retval =3D (AD_SHORT_TIM=
EOUT_TIME*ad_ticks_per_sec);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 retval =3D (AD_LONG_TIME=
OUT_TIME*ad_ticks_per_sec);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 =A0 case AD_ACTOR_CHURN_TIMER: =A0 =A0 =A0/* for local churn=
 machine */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 retval =3D (AD_CHURN_DETECTION_TIME*ad_t=
icks_per_sec);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 =A0 case AD_PERIODIC_TIMER: =A0 =A0 =A0 =A0 /* for periodic =
machine */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 retval =3D (par*ad_ticks_per_sec);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 =A0 case AD_PARTNER_CHURN_TIMER: =A0 =A0/* for remote churn =
machine */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 retval =3D (AD_CHURN_DETECTION_TIME*ad_t=
icks_per_sec);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 =A0 case AD_WAIT_WHILE_TIMER: =A0 =A0 =A0 /* for selection m=
achine */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 retval =3D (AD_AGGREGATE_WAIT_TIME*ad_ti=
cks_per_sec);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 =A0 }
>> =A0 =A0 =A0 =A0 return retval;
>> }
>>
>> If, for some unknown reason timer_type receives an 'alien' value, and
>> we were
>> using retval uninitialized, this function, as it is, would return an
>> unpredictable value to its caller. Unless we have the switch block
>> re-factored, we cannot leave retval uninitialized. So, it's not just a
>> matter of leaving the variable uninitialized, or initialize it just to
>> get rid of a compiler warning. That's why those comments are not
>> helpful anyway.
>
> I'd write this not using a retval variable at all as:

But isn't the preferred style to have a single exit point?

> =A0 =A0 =A0 =A0switch (timer_type) {
> =A0 =A0 =A0 =A0case AD_CURRENT_WHILE_TIMER: =A0 =A0/* for rx machine usag=
e */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (par)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return AD_SHORT_TIMEOUT_TI=
ME * ad_ticks_per_sec;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return AD_LONG_TIMEOUT_TIME * ad_ticks_per=
_sec;
> =A0 =A0 =A0 =A0case AD_ACTOR_CHURN_TIMER: =A0 =A0 =A0/* for local churn m=
achine */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return AD_CHURN_DETECTION_TIME * ad_ticks_=
per_sec;
> =A0 =A0 =A0 =A0...
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0WARN(1, "Invalid timer type: %u\n", timer_type)
> =A0 =A0 =A0 =A0return 0;
> }
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
GPG-Key: 9AFE00EA
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
