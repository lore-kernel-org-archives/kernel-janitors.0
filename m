From: Harsh Kumar <harsh1kumar@gmail.com>
Date: Wed, 26 Sep 2012 03:51:11 +0000
Subject: Re: [Patch] Driver: Staging: checkpatch cleanup for drivers/staging/winbond/wb35tx_s.h
Message-Id: <CAFfwLZgvWfSE0mgFyhpQXDhxoLgbnoAYg3tC-URF2v1Yc3Ga5A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <506210B8.7000604@gmail.com>
In-Reply-To: <506210B8.7000604@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Thanks Dan for the reply.
I am a kernel newbie so this will help me learn. I will make the
required changes and try to avoid them next time.

On Wed, Sep 26, 2012 at 2:21 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Wed, Sep 26, 2012 at 01:44:48AM +0530, Harsh Kumar wrote:
>> checkpatch cleanup for drivers/staging/winbond/wb35tx_s.h
>>
>> 1) Changed c99 comments to c89 comments
>> 2) Removed undesired spaces which were causing checkpatch errors.
>>
>
> Can you break this up into two patches.
>
> This doesn't apply for me on linux-next (please redo it so it
> applies).
>
>> Signed-off-by: Harsh Kumar <harsh1kumar@gmail.com>
>>
>> diff -uprN a/drivers/staging/winbond/wb35tx_s.h b/drivers/staging/winbond/wb35tx_s.h
>> --- a/drivers/staging/winbond/wb35tx_s.h
>> +++ b/drivers/staging/winbond/wb35tx_s.h
>> @@ -3,45 +3,45 @@
>>
>>  #include "mds_s.h"
>>
>> -//==================
>> -// IS89C35 Tx related definition
>> -//==================
>> -#define TX_INTERFACE                 0       // Interface 1
>> -#define TX_PIPE                                      3       // endpoint 4
>> -#define TX_INTERRUPT                 1       // endpoint 2
>> -#define MAX_INTERRUPT_LENGTH 64      // It must be 64 for EP2 hardware
>> +/**********************************
>> +* IS89C35 Tx related definition
>> +***********************************/
>
> Just make these a normal comments.
>
> /* IS89C35 Tx related definitions */
>
> Or for multi-line:
>
> /*
>  * IS89C35 Tx related blah blah blha blah blah blah blah blha blah
>  * definitions
>  */
>
> There is a section on comments in CodingStyle.
>
>> +#define TX_INTERFACE         0       /* Interface 1 */
>> +#define TX_PIPE                      3       /* Endpoint 4 */
>> +#define TX_INTERRUPT         1       /* Endpoint 2 */
>> +#define MAX_INTERRUPT_LENGTH 64      /* It must be 64 for EP2 hardware */
>>
>>
>>
>
> Only one blank line at a time.  (Although that was there in the
> original so that's fine).
>
>> -//==================
>> -// Internal variable for module
>> -//==================
>> +/**********************************
>> +* Internal variable for module
>> +***********************************/
>>
>>
>>  struct wb35_tx {
>> -     // For Tx buffer
>> -     u8      TxBuffer[ MAX_USB_TX_BUFFER_NUMBER ][ MAX_USB_TX_BUFFER ];
>> +     /* For Tx buffer */
>> +     u8      TxBuffer[MAX_USB_TX_BUFFER_NUMBER][MAX_USB_TX_BUFFER];
>>
>> -     // For Interrupt pipe
>> +     /* For Interrupt pipe */
>>       u8      EP2_buf[MAX_INTERRUPT_LENGTH];
>>
>> -     atomic_t        TxResultCount;// For thread control of EP2 931130.4.m
>> -     atomic_t        TxFireCounter;// For thread control of EP4 931130.4.n
>> -     u32                     ByteTransfer;
>> -
>> -     u32         TxSendIndex;// The next index of Mds array to be sent
>> -     u32         EP2vm_state; // for EP2vm state
>> -     u32         EP4vm_state; // for EP4vm state
>> -     u32         tx_halt; // Stopping VM
>> +     atomic_t        TxResultCount;/* For thread control of EP2 931130.4.m */
>                                       ^
> Put a space there, between the semi-colon and the comment.
>
> regards,
> dan carpenter
>
