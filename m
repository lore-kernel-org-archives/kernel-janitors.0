From: "Manish Katiyar" <mkatiyar@gmail.com>
Date: Fri, 31 Oct 2008 01:53:12 +0000
Subject: Re: Confusion about unused variable warnings during kernel build.
Message-Id: <ea11fea30810301853r732e2f51h40ad794ee72fc684@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30810282321x4e54617dq5e7d273ac5ff131f@mail.gmail.com>
In-Reply-To: <ea11fea30810282321x4e54617dq5e7d273ac5ff131f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Oct 31, 2008 at 12:42 AM, Marcin Slusarz
<marcin.slusarz@gmail.com> wrote:
> On Wed, Oct 29, 2008 at 11:51:20AM +0530, Manish Katiyar wrote:
>> Hi,
>>
>> Occasionally during kernel builds I get some unused variable warnings.
>> But when I go and check the code the variable is getting used.
>> Interestingly I have seen this problem only with the file symbols
>> exported from fs/locks.c. An example of such errors is
>>
>> fs/lockd/svclock.c:719: warning: unused variable 'file'
>> fs/nfsd/nfsxdr.c:154: warning: unused variable 'dentry'
>> fs/nfsd/nfs4state.c:1626: warning: unused variable 'flp'
>
> Check the definition of functions which "use" these variables.

I checked them and they are very much used. I can understand if they
would have been in some #ifdef but that doesn't seem to be the case
here.

Thanks -
Manish


>
> Marcin
>
