From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 17 Jul 2010 20:26:31 +0000
Subject: Re: [PATCH 1/3] fix staging/spectra: removes q->prepare_flush_fn
Message-Id: <1279398391.14049.5.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278732312.1725.17.camel@lenovo>
In-Reply-To: <1278732312.1725.17.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

>>>
>>> These 3 patches fix the build errors.
>>> There are still some warnings that should be addressed.
>>>
>>> Thanks.
>>>
>>> Acked-by: Randy Dunlap <randy.dunlap@oracle.com>
>>>
>>>
>>
>> Thanks a lot for reviewing the patches. I can address the warnings.
>> Should I send patches as a delta of these three patches or do I resend
>> a patchset containing  these three and the others that will address
>> the warnings?
>
> Greg, which do you prefer?
>
> I would just send more patches as deltas, but it's up to Greg.
> AFAIK, he hasn't applied these 3 yet.
>

I prepared another patchset that removes all the warnings. This patches are=
 a delta from the previous patchset so it assumes that these three patches =
all already applied:

[PATCH 1/3] fix staging/spectra: removes q->prepare_flush_fn
[PATCH 2/3] fix staging/spectra: use new REQ_FLUSH flag
[PATCH 3/3] fix staging/spectra: don't use locked_ioctl

The new patchset contains the following patches:

[PATCH 1/4] staging/spectra: remove duplicate GLOB_VERSION definition
[PATCH 2/4] staging/spectra: remove unused variable
[PATCH 3/4] staging/spectra: initializa lblk variable
[PATCH 4/4] staging/spectra: remove unused functions

Best regards,

-----------------------------------------
Javier Mart=C3=ADnez Canillas
+595 981 88 66 58



--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
