From: walter harms <wharms@bfs.de>
Date: Wed, 06 Jun 2012 12:28:59 +0000
Subject: Re: [patch] staging: comedi: cleanup comedi_recognize()
Message-Id: <4FCF4D0B.60806@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120524102851.GA4399@elgon.mountain>
In-Reply-To: <20120524102851.GA4399@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 06.06.2012 13:20, schrieb Ian Abbott:
> On 2012-06-06 10:49, Dan Carpenter wrote:
>> On Wed, Jun 06, 2012 at 11:45:43AM +0200, walter harms wrote:
>>>
>>>
>>> Am 06.06.2012 11:28, schrieb Ian Abbott:
>>>> On 2012-06-05 12:01, Dan Carpenter wrote:
>>>>> On Tue, Jun 05, 2012 at 12:06:10PM +0200, walter harms wrote:
>>>>>> Hi all,
>>>>>> the patch is fine with me but i have a few basic questions:
>>>>>>
>>>>>> Why the (void  *) at all ? it returns a name what is a const char *.
>>>>>>
>>>>>
>>>>> We're really returning a pointer to a private struct, it's just that
>>>>> the first element on the struct always has to be a pointer to char *.
>>>>
>>>> To be pedantic, it's really returning a pointer to some member of type
>>>> 'const char *' within a private struct.  To make life easier for
>>>> themselves, those drivers make that the first member of the private
>>>> struct so a void pointer to the member is also a void pointer to the
>>>> struct.
>>>>
>>>
>>> I do not like it. It is confusing.
>>
>> Yep.
> 
> But at least the confusion is concentrated in a single place!  From the
> individual drivers' point of view it's fairly simple (as long as it puts
> the 'const char pointer to board name' member at the top of its private
> data structure).
> 

Sometimes you can not write "clean" code but a few lines of comments are
then a must.


>>> Are these struct comedi_driver *driv of different size every time ?
>>
>> Nope.
> 
> It's the private board information data structures for each driver that
> are different sizes, but the size is passed in the comedi comedi_driver
> 'offset' member along with the 'board_name' and 'num_names' members. Not
> all drivers set those members and just use the 'driver_name' to match
> any supported device, but I digress.
> 
If i can believe the comments in the structure offset is the distance to the next
name  /* offset in bytes from one board name pointer to the next */
and the name is not the first entry it is the second.
That means any program assuming that this code returns a (struct comedi_driver *)
has to do some correction or it will be off-bye-one sizeof(struct comedi_driver *).
Please correct me if i am wrong:

I have no clue how dev->board_ptr is used, if it works it is fine with me.

re,
 wh
