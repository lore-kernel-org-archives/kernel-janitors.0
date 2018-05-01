From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Date: Tue, 01 May 2018 11:41:28 +0000
Subject: Re: [PATCH -next] efi/libstub/tpm: Make function efi_retrieve_tpm2_eventlog_1_2() static
Message-Id: <20180501114128.GA20978@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1521555478-29097-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1521555478-29097-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Apr 24, 2018 at 08:39:09AM +0200, Ard Biesheuvel wrote:
> On 23 April 2018 at 21:38, Jarkko Sakkinen
> <jarkko.sakkinen@linux.intel.com> wrote:
> > On Mon, Apr 16, 2018 at 01:05:24PM +0200, Ard Biesheuvel wrote:
> >> On 22 March 2018 at 15:09, Jarkko Sakkinen
> >> <jarkko.sakkinen@linux.intel.com> wrote:
> >> > On Thu, 2018-03-22 at 16:06 +0200, Jarkko Sakkinen wrote:
> >> >> On Tue, 2018-03-20 at 14:17 +0000, Wei Yongjun wrote:
> >> >> > Fixes the following sparse warning:
> >> >> >
> >> >> > drivers/firmware/efi/libstub/tpm.c:62:6: warning:
> >> >> >  symbol 'efi_retrieve_tpm2_eventlog_1_2' was not declared. Should it be
> >> >> > static?
> >> >> >
> >> >> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> >> >> > ---
> >> >> >  drivers/firmware/efi/libstub/tpm.c | 2 +-
> >> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >> >
> >> >> > diff --git a/drivers/firmware/efi/libstub/tpm.c
> >> >> > b/drivers/firmware/efi/libstub/tpm.c
> >> >> > index 9d08cea..caa37a6 100644
> >> >> > --- a/drivers/firmware/efi/libstub/tpm.c
> >> >> > +++ b/drivers/firmware/efi/libstub/tpm.c
> >> >> > @@ -59,7 +59,7 @@ void efi_enable_reset_attack_mitigation(efi_system_table_t
> >> >> > *sys_table_arg)
> >> >> >
> >> >> >  #endif
> >> >> >
> >> >> > -void efi_retrieve_tpm2_eventlog_1_2(efi_system_table_t *sys_table_arg)
> >> >> > +static void efi_retrieve_tpm2_eventlog_1_2(efi_system_table_t
> >> >> > *sys_table_arg)
> >> >> >  {
> >> >> >     efi_guid_t tcg2_guid = EFI_TCG2_PROTOCOL_GUID;
> >> >> >     efi_guid_t linux_eventlog_guid = LINUX_EFI_TPM_EVENT_LOG_GUID;
> >> >> >
> >> >>
> >> >> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> >> >
> >> > Applied.
> >> >
> >>
> >> Applied to?
> >
> > Mistake, efi maintainers should pick this one up. Sorry (my reviewed tag
> > still holds).
> >
> 
> Thanks. I have queued this up in efi/next

And sorry for the confusion! Had a lot of traffic that point..

/Jarkko
