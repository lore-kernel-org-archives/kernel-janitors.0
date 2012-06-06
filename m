From: Ian Abbott <abbotti@mev.co.uk>
Date: Wed, 06 Jun 2012 14:11:05 +0000
Subject: Re: [patch] staging: comedi: cleanup comedi_recognize()
Message-Id: <4FCF64F9.6020602@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120524102851.GA4399@elgon.mountain>
In-Reply-To: <20120524102851.GA4399@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2012-06-06 13:28, walter harms wrote:
> Am 06.06.2012 13:20, schrieb Ian Abbott:
>> On 2012-06-06 10:49, Dan Carpenter wrote:
>>> On Wed, Jun 06, 2012 at 11:45:43AM +0200, walter harms wrote:
>>>>
>>>>
>>>> Am 06.06.2012 11:28, schrieb Ian Abbott:
>>>>> On 2012-06-05 12:01, Dan Carpenter wrote:
>>>>>> On Tue, Jun 05, 2012 at 12:06:10PM +0200, walter harms wrote:
>>>>>>> Hi all,
>>>>>>> the patch is fine with me but i have a few basic questions:
>>>>>>>
>>>>>>> Why the (void  *) at all ? it returns a name what is a const char *.
>>>>>>>
>>>>>>
>>>>>> We're really returning a pointer to a private struct, it's just that
>>>>>> the first element on the struct always has to be a pointer to char *.
>>>>>
>>>>> To be pedantic, it's really returning a pointer to some member of type
>>>>> 'const char *' within a private struct.  To make life easier for
>>>>> themselves, those drivers make that the first member of the private
>>>>> struct so a void pointer to the member is also a void pointer to the
>>>>> struct.
>>>>>
>>>>
>>>> I do not like it. It is confusing.
>>>
>>> Yep.
>>
>> But at least the confusion is concentrated in a single place!  From the
>> individual drivers' point of view it's fairly simple (as long as it puts
>> the 'const char pointer to board name' member at the top of its private
>> data structure).
>>
>
> Sometimes you can not write "clean" code but a few lines of comments are
> then a must.
>
>
>>>> Are these struct comedi_driver *driv of different size every time ?
>>>
>>> Nope.
>>
>> It's the private board information data structures for each driver that
>> are different sizes, but the size is passed in the comedi comedi_driver
>> 'offset' member along with the 'board_name' and 'num_names' members. Not
>> all drivers set those members and just use the 'driver_name' to match
>> any supported device, but I digress.
>>
> If i can believe the comments in the structure offset is the distance to the next
> name  /* offset in bytes from one board name pointer to the next */
> and the name is not the first entry it is the second.

This board name pointer is in a driver-specific, board information 
struct.  All of them make it the first member of the driver-specific 
struct for convenience, although they don't need to - they could use 
offsetof() or container_of() to convert the pointer to the member to a 
pointer to the containing struct.  The comedi core does not care about 
the driver-specific struct but needs to be told how to access the board 
names in an initialized array of these structs.

> That means any program assuming that this code returns a (struct comedi_driver *)
> has to do some correction or it will be off-bye-one sizeof(struct comedi_driver *).
> Please correct me if i am wrong:
>
> I have no clue how dev->board_ptr is used, if it works it is fine with me.

If the low-level driver initializes 'board_name', 'offset' and 
'num_names' to something non-zero in its 'struct comedi_driver' then 
'dev->board_ptr' will point to one of the board name pointers in 
initialized array of driver-specific, board information structs when the 
driver's attach() hook is called.  If 'num_names' is 0, 'dev->board_ptr' 
will be NULL when the attach() hook is called.  In either case, the 
low-level driver is free to change the value of 'dev->board_ptr' for its 
own purposes, although generally it will be pointed to some element of 
its array of board information structs.

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk>        )=-
-=( Tel: +44 (0)161 477 1898   FAX: +44 (0)161 718 3587         )=-
