From: Jerry Snitselaar <jsnitsel@redhat.com>
Date: Tue, 08 Oct 2019 16:15:53 +0000
Subject: Re: [PATCH][next] efi/tpm: fix sanity check of unsigned tbl_size being less than zero
Message-Id: <20191008161553.qls5lbyaxlasw25v@cantor>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191008100153.8499-1-colin.king@canonical.com>
 <20191008114559.GD25098@kadam>
In-Reply-To: <20191008114559.GD25098@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Colin King <colin.king@canonical.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Ingo Molnar <mingo@kernel.org>, linux-efi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue Oct 08 19, Dan Carpenter wrote:
>On Tue, Oct 08, 2019 at 11:01:53AM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently the check for tbl_size being less than zero is always false
>> because tbl_size is unsigned. Fix this by making it a signed int.
>>
>> Addresses-Coverity: ("Unsigned compared against 0")
>> Fixes: e658c82be556 ("efi/tpm: Only set 'efi_tpm_final_log_size' after successful event log parsing")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/firmware/efi/tpm.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/efi/tpm.c b/drivers/firmware/efi/tpm.c
>> index 703469c1ab8e..ebd7977653a8 100644
>> --- a/drivers/firmware/efi/tpm.c
>> +++ b/drivers/firmware/efi/tpm.c
>> @@ -40,7 +40,7 @@ int __init efi_tpm_eventlog_init(void)
>>  {
>>  	struct linux_efi_tpm_eventlog *log_tbl;
>>  	struct efi_tcg2_final_events_table *final_tbl;
>> -	unsigned int tbl_size;
>> +	int tbl_size;
>>  	int ret = 0;
>
>
>Do we need to do a "ret = tbl_size;"?  Currently we return success.
>It's a pitty that tpm2_calc_event_log_size() returns a -1 instead of
>-EINVAL.
>
>regards,
>dan carpenter
>

perhaps "ret = -EINVAL;"? Currently nothing checks the return value of efi_tpm_eventlog_init though.
