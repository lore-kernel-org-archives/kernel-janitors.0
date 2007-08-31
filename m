From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Fri, 31 Aug 2007 16:35:32 +0000
Subject: Re: [patch 3/3] fs/cramfs/inode.c: remove error variable
Message-Id: <46D84354.7020906@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200708301737.49018.lists-receive@programmierforen.de>
In-Reply-To: <200708301737.49018.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Andi Drebes wrote:
> Am Freitag, 31. August 2007 18:12 schrieb Nishanth Aravamudan:
>   
>> On 31.08.2007 [13:43:18 +0200], Richard Knutsson wrote:
>>     
>>> Andi Drebes wrote:
>>>       
>>>> This patch removes a variable from fs/cramfs/inode.c that is just used to 
>>>> store
>>>> a return value which is immediately read afterwards.
>>>>
>>>> Tested on an i386 box.
>>>> Signed-off-by: Andi Drebes <lists-receive@programmierforen.de>
>>>> ---
>>>> diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
>>>> index 350680f..42d2cf8 100644
>>>> --- a/fs/cramfs/inode.c
>>>> +++ b/fs/cramfs/inode.c
>>>> @@ -372,7 +372,7 @@ static int cramfs_readdir(struct file *filp, void 
>>>> *dirent, filldir_t filldir)
>>>> 		char *name;
>>>> 		ino_t ino;
>>>> 		mode_t mode;
>>>> -		int namelen, error;
>>>> +		int namelen;
>>>>
>>>> 		mutex_lock(&read_mutex);
>>>> 		de = cramfs_read(sb, OFFSET(inode) + offset, 
>>>> 		sizeof(*de)+CRAMFS_MAXPATHLEN);
>>>> @@ -398,8 +398,7 @@ static int cramfs_readdir(struct file *filp, void 
>>>> *dirent, filldir_t filldir)
>>>> 				break;
>>>> 			namelen--;
>>>> 		}
>>>> -		error = filldir(dirent, buf, namelen, offset, ino, mode >> 
>>>> 12);
>>>> -		if (error)
>>>> +		if(filldir(dirent, buf, namelen, offset, ino, mode >> 12))
>>>>  
>>>>         
>>> Maybe picky but please leave it as "if (".
>>>       
>> Beyond that, I just don't like this change. I thought the preferred way
>> for these types of statements was the previous version. That is:
>>
>> error = filldir(...);
>> if (error)
>> 	error stuff
>>
>> Rather than a conditional with potential side-effects?
>>     
> OK. Maybe I exaggerated a little bit with this change. The most important
> ones are those in patch 1/3 and 2/3. Maybe the best thing is to abolish the
> last patch that deals with the error variable and to apply only the first two
> patches.
>   
Better/easier to do too much and cut it down a little then the other way 
around. ;)
> I didn't really get why "if (foo)" is better than "if(foo)". Is it just a matter of style?
>   
See the all mighty CodingStyle on 3.1
(however, it should not be taken too far but I don't see the advantage 
to make it "if(")

cu
Richard Knutsson

