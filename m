From: Michael Chan <michael.chan@broadcom.com>
Date: Tue, 28 Nov 2017 17:11:55 +0000
Subject: Re: [PATCH] bnxt_en: Fix an error handling path in 'bnxt_get_module_eeprom()'
Message-Id: <CACKFLinbowscXBnaHmTQ-f8SEO1j4ObTW5N5R1G6eLnXS2POfw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171121194649.11724-1-christophe.jaillet@wanadoo.fr> <20171128.105602.879657812684686339.davem@davemloft.net>
In-Reply-To: <20171128.105602.879657812684686339.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Netdev <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Nov 28, 2017 at 7:56 AM, David Miller <davem@davemloft.net> wrote:
> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Date: Tue, 21 Nov 2017 20:46:49 +0100
>
>> Error code returned by 'bnxt_read_sfp_module_eeprom_info()' is handled a
>> few lines above when reading the A0 portion of the EEPROM.
>> The same should be done when reading the A2 portion of the EEPROM.
>>
>> In order to correctly propagate an error, update 'rc' in this 2nd call as
>> well, otherwise 0 (success) is returned.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>
> Patch applied, thanks Chrisophe.
>
> I cannot see any legitimate reason to ignore errors returned here, as
> an error would mean a partial read back of the data to the caller.

Sorry I was on vacation and missed this earlier.  The reason we don't
check for errors in the 2nd part is that the 2nd page may not be
present on some eeproms.

But I think the patch is fine because we return the proper length in
.get_module_info().  So we will now return error only if the user
specifies an invalid length, which is fine.  Thanks.
