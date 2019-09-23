From: Connor Kuehl <connor.kuehl@canonical.com>
Date: Mon, 23 Sep 2019 20:49:21 +0000
Subject: Re: [PATCH] staging: rtl8188eu: remove dead code in do-while conditional step
Message-Id: <25c92ca9-0025-503e-3468-0df5de8ec2c9@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190923194806.25347-1-connor.kuehl@canonical.com>
 <c2ce3fb0-6407-982a-a3f2-172cef17f2a6@lwfinger.net>
In-Reply-To: <c2ce3fb0-6407-982a-a3f2-172cef17f2a6@lwfinger.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Larry Finger <Larry.Finger@lwfinger.net>, gregkh@linuxfoundation.org, straube.linux@gmail.com, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 9/23/19 1:38 PM, Larry Finger wrote:
> On 9/23/19 2:48 PM, Connor Kuehl wrote:
>> The local variable 'bcmd_down' is always set to true almost immediately
>> before the do-while's condition is checked. As a result, !bcmd_down
>> evaluates to false which short circuits the logical AND operator meaning
>> that the second operand is never reached and is therefore dead code.
>>
>> Addresses-Coverity: ("Logically dead code")
>>
>> Signed-off-by: Connor Kuehl <connor.kuehl@canonical.com>
>> ---
>>   drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c 
>> b/drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c
>> index 47352f210c0b..a4b317937b23 100644
>> --- a/drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c
>> +++ b/drivers/staging/rtl8188eu/hal/rtl8188e_cmd.c
>> @@ -48,7 +48,6 @@ static u8 _is_fw_read_cmd_down(struct adapter 
>> *adapt, u8 msgbox_num)
>>   static s32 FillH2CCmd_88E(struct adapter *adapt, u8 ElementID, u32 
>> CmdLen, u8 *pCmdBuffer)
>>   {
>>       u8 bcmd_down = false;
>> -    s32 retry_cnts = 100;
>>       u8 h2c_box_num;
>>       u32 msgbox_addr;
>>       u32 msgbox_ex_addr;
>> @@ -103,7 +102,7 @@ static s32 FillH2CCmd_88E(struct adapter *adapt, 
>> u8 ElementID, u32 CmdLen, u8 *p
>>           adapt->HalData->LastHMEBoxNum >>               (h2c_box_num+1) % RTL88E_MAX_H2C_BOX_NUMS;
>> -    } while ((!bcmd_down) && (retry_cnts--));
>> +    } while (!bcmd_down);
>>       ret = _SUCCESS;
> 
> This patch is correct; however, the do..while loop will always be 
> executed once, thus you could remove the loop and the loop variable 
> bcmd_down.

Ah, yes! That makes sense, good catch.

> 
> @greg: If you would prefer a two-step process, then this one is OK.

I'll do whichever is preferred. I'm happy to NACK this and send a v2 
with the dead code and loop removed or I can send a separate patch based 
on this one to remove the loop.

Thank you,

Connor

> 
> Larry
> 
