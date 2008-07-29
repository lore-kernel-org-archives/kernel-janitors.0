From: Jacob <jacobchappelle@gmail.com>
Date: Tue, 29 Jul 2008 23:15:12 +0000
Subject: Re: How to fix warning 'control reaches end of non-void function'
Message-Id: <3ec81ae0807291615s31abfd36k1a67a830591799eb@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080729191738.GA32506@orion>
In-Reply-To: <20080729191738.GA32506@orion>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If we haven't beat this to death yet, the right way to fix these warnings
is to return a "smth" data type... which most people have commented on

// original version
smth function()
{
       switch (var) {
       case one:
               return 1;
       default:
               BUG();
       }
}

// modified version
smth function()
{
       smth ret = 0;
       switch (var) {   // unless this is a global var is undefined
       case one:
               ret = 1;  // 1 was not a 'smth' type so we should use
the function's return type or face compiler errors/warnings
               break;   // unless you want hard to find bugs always
include a break;
       default:
               BUG(); // if this is a macro does it return a value?
               ret = 0;
               break;
       }
       return ret;  // since we are returning a 'smth' type we do not
let control reach the end of this non-void funtion
}


Where does this function get used, and what is it used for?

Jacob



On Tue, Jul 29, 2008 at 3:38 PM, Rene Herman <rene.herman@keyaccess.nl> wrote:
> On 29-07-08 21:17, Alexander Beregalov wrote:
>
>> What is it a right way to fix these warnings?
>>
>> smth function()
>> {
>>        switch (var) {
>>        case one:
>>                return 1;
>>        default:
>>                BUG();
>>        }
>> }
>>
>> warning: control reaches end of non-void function
>
> BUG() may actually do nothing so I'd just reorder things around as
>
> int function(void)
> {
>        switch (var) {
>        case 1:
>                break;
>        default:
>                BUG();
>        }
>        return 1;
> }
>
> Rene.
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
