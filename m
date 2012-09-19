From: Toshiaki Yamane <yamanetoshi@gmail.com>
Date: Wed, 19 Sep 2012 23:36:21 +0000
Subject: Re: [staging:staging-next 67/134] drivers/staging/rts_pstor/rtsx.c:397:16-19: ERROR: dev is NULL but
Message-Id: <CAOTypNSL_hc5ryVkOd8P-oRzPuYpAjpu1fbHePKheUdacULNbQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120919151828.GA28886@localhost>
In-Reply-To: <20120919151828.GA28886@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Sep 20, 2012 at 1:50 AM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Wed, Sep 19, 2012 at 11:18:28PM +0800, Fengguang Wu wrote:
>> Hi Toshiaki,
>>
>> FYI, there are new coccinelle warnings show up in
>>
>> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-next
>> head:   95bc359f98a077a5cfc34feb0a333d11a4124b1c
>> commit: d084610bb1e825eb60a1ca81a801aedfd36ff332 [67/134] staging/rts_pstor: Use pr_ or dev_ printks in rtsx.c
>>
>> All coccinelle warnings:
>>
>> + drivers/staging/rts_pstor/rtsx.c:397:16-19: ERROR: dev is NULL but dereferenced.
>>   drivers/staging/rts_pstor/rtsx.c:447:16-19: ERROR: dev is NULL but dereferenced.
>>   drivers/staging/rts_pstor/rtsx.c:358:16-19: ERROR: dev is NULL but dereferenced.
>>
>> vim +397 drivers/staging/rts_pstor/rtsx.c
>>    387        }
>>    388
>>    389        static int rtsx_resume(struct pci_dev *pci)
>>    390        {
>>    391                struct rtsx_dev *dev = (struct rtsx_dev *)pci_get_drvdata(pci);
>>    392                struct rtsx_chip *chip;
>>    393
>>    394                dev_info(&dev->pci->dev, "Ready to resume\n");
>>    395
>>    396                if (!dev) {
>>  > 397                        dev_err(&dev->pci->dev, "Invalid memory\n");
>>    398                        return 0;
>>    399                }
>
> What about the dev_info() check?  Shouldn't that also trigger the same
> coccinelle warning?  It looks just as wrong :)
>
> Both of these lines (dev_info() and dev_err()), should just be removed
> entirely, solving this problem, and making the syslog less noisy.
>
> Toshiaki, care to make up a patch fixing this up?

Fengguang-san, Greg-san,

Thanks for your reply.
I will try to fix it.


-- 

Regards,

YAMANE Toshiaki
