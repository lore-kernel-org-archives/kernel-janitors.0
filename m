From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Tue, 27 Sep 2016 09:48:19 +0000
Subject: Re: [PATCH] greybus: manifest: style fix missing space before '('
Message-Id: <CAKohpom-C0XjiNPhKGetX9iY_ik5t8No+=ehvnyPP2vDJkR1qQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160927092028.13119-1-lambert.quentin@gmail.com>
 <CAOh2x=m31uDE8Nn5CyX9_2XKQ594fe0XKqz9j6pqW3Gj++u+fg@mail.gmail.com> <728f3214-c9f2-837b-6725-f95777c23bab@gmail.com>
In-Reply-To: <728f3214-c9f2-837b-6725-f95777c23bab@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:ANDROID DRIVERS" <devel@driverdev.osuosl.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 27 September 2016 at 15:03, Quentin Lambert
<lambert.quentin@gmail.com> wrote:
>
>
> On 27/09/2016 11:31, Viresh Kumar wrote:
>>
>> On Tue, Sep 27, 2016 at 2:50 PM, Quentin Lambert
>> <lambert.quentin@gmail.com> wrote:
>>>
>>> Checkpatch printed a style ERROR concerning a missing space befire '('.
>>> This patch fix this issue.
>>>
>>> Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
>>> ---
>>>   drivers/staging/greybus/manifest.c |    2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> --- a/drivers/staging/greybus/manifest.c
>>> +++ b/drivers/staging/greybus/manifest.c
>>> @@ -11,7 +11,7 @@
>>>
>>>   static const char *get_descriptor_type_string(u8 type)
>>>   {
>>> -       switch(type) {
>>> +       switch (type) {
>>>          case GREYBUS_TYPE_INVALID:
>>>                  return "invalid";
>>>          case GREYBUS_TYPE_STRING:
>>
>> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
>
> Wow I just noticed the typo: "befire" do you want me to resend ?

Oops, sorry for missing that.

Yes, please resend the patch as V2 and feel free to add my Ack to it.

--
viresh
