From: Mark Asselstine <asselsm@gmail.com>
Date: Mon, 19 Apr 2010 19:51:40 +0000
Subject: Re: [PATCH] mmc: sd: Cleanup redundant memset
Message-Id: <p2j919fe2b31004191251u937fc1d0p6ae7edf083679662@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1270687256-17061-1-git-send-email-asselsm@gmail.com>
In-Reply-To: <1270687256-17061-1-git-send-email-asselsm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Sun, Apr 18, 2010 at 2:38 PM, Dan Carpenter <error27@gmail.com> wrote:
> On Wed, Apr 07, 2010 at 08:40:56PM -0400, Mark Asselstine wrote:
>> The clearing of mrq via a memset at the top of the for loop in
>> mmc_wait_for_app_cmd() is not required as mrq is not used and
>> there is another clearing of mrq just below. We remove the first
>> memset since if the initial tests in the for loop fail the memset
>> is not required.
>>
>
> This patch is good.
>
> MMC is orphan, but there is a mailing list.
>
> Does anyone on kernel-janitors actually collect patches? =A0Otherwise if =
you
> send this to lkml Andrew Morton quite often picks these up.

Done already. Andrew picked it up and it should be in his -mm tree now.

Mark

>
> regards,
> dan carpenter
>
>> Signed-off-by: Mark Asselstine <asselsm@gmail.com>
>> ---
>> =A0drivers/mmc/core/sd_ops.c | =A0 =A02 --
>> =A01 files changed, 0 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mmc/core/sd_ops.c b/drivers/mmc/core/sd_ops.c
>> index 0d96080..63772e7 100644
>> --- a/drivers/mmc/core/sd_ops.c
>> +++ b/drivers/mmc/core/sd_ops.c
>> @@ -79,8 +79,6 @@ int mmc_wait_for_app_cmd(struct mmc_host *host, struct=
 mmc_card *card,
>> =A0 =A0 =A0 =A0* we cannot use the retries field in mmc_command.
>> =A0 =A0 =A0 =A0*/
>> =A0 =A0 =A0 for (i =3D 0;i <=3D retries;i++) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 memset(&mrq, 0, sizeof(struct mmc_request));
>> -
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D mmc_app_cmd(host, card);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (err) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* no point in retrying; no =
APP commands allowed */
>> --
>> 1.7.0
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe kernel-janitor=
s" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
