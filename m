From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Date: Sun, 04 Mar 2012 09:29:43 +0000
Subject: Re: [PATCH] netxen: memory corruption by netxen_p3_get_mac_addr.
Message-Id: <CAOD=uF4Z2RgJVy0A_KJrYtzWzCCj-V+dB5zGXPC0bsDK7QkZxQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330794087-19248-1-git-send-email-santoshprasadnayak@gmail.com>
	<20120303183538.GZ1003@mwanda>
In-Reply-To: <20120303183538.GZ1003@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: sony.chacko@qlogic.com
Cc: rajesh.borundia@qlogic.com, netdev@vger.kernel.org, Dhananjay Phadke <dhananjay@netxen.com>, kernel-janitors@vger.kernel.org

I would like to drop this patch.


Actually I was trying to simulate the code block by generating assembly code
which looked like  as shown below.  But later I realized it does not
fit with present scenario.
Its for different scenario.

---------------------------------------------------------------------------=
---------------------------
 80483cb:	83 ec 2c             	sub    $0x2c,%esp
 80483ce:	66 c7 44 24 1e e1 2e 	movw   $0x2ee1,0x1e(%esp)
 80483d5:	66 c7 44 24 1c e1 2e 	movw   $0x2ee1,0x1c(%esp)
 80483dc:	0f b7 44 24 1c       	movzwl 0x1c(%esp),%eax
 80483e1:	c1 e0 04             	shl    $0x4,%eax
 80483e4:	88 44 24 1b          	mov    %al,0x1b(%esp)
 80483e8:	0f b6 5c 24 1b       	movzbl 0x1b(%esp),%ebx
 80483ed:	0f b7 4c 24 1c       	movzwl 0x1c(%esp),%ecx
 80483f2:	0f b7 54 24 1e       	movzwl 0x1e(%esp),%edx
---------------------------------------------------------------------------=
---------------------------------



Following assembly code looks very near to present scenario.
And  there is no data loss .

---------------------------------------------------------------------------=
--------------------
 804839a:	83 ec 10             	sub    $0x10,%esp
 804839d:	66 c7 44 24 0e e1 2e 	movw   $0x2ee1,0xe(%esp)
 80483a4:	66 c7 44 24 0c e1 2e 	movw   $0x2ee1,0xc(%esp)
 80483ab:	0f b7 44 24 0c       	movzwl 0xc(%esp),%eax
 80483b0:	ba 00 00 00 00       	mov    $0x0,%edx
 80483b5:	0f a4 c2 04          	shld   $0x4,%eax,%edx
 80483b9:	c1 e0 04             	shl    $0x4,%eax
 80483bc:	89 04 24             	mov    %eax,(%esp)
 80483bf:	89 54 24 04          	mov    %edx,0x4(%esp)
 80483c3:	b8 00 00 00 00       	mov    $0x0,%eax
---------------------------------------------------------------------------=
------------------------


Sorry for the inconvenience.


Regarding endian issue:
--------------------------------------
   Can Rajesh or Dhananjay comment on it ?
   Is "le64_to_cpu"  there intentionally ??



Regards
santosh


On Sun, Mar 4, 2012 at 12:05 AM, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
> On Sat, Mar 03, 2012 at 10:31:27PM +0530, santosh nayak wrote:
>> From: Santosh Nayak <santoshprasadnayak@gmail.com>
>>
>> 'mac_hi' and 'mac_lo' are 32 bit unsinged int but we are modifing
>> 64 bit of memory during mac calculation. To fix this issue define
>> a local variable of 64 bit and do mac calculation.
>>
>
> I'm not seeing any memory corruption. =A0How do you figure?
>
>> Remove 'le64_to_cpu' to fix endian issue.
>
> I've add Dhananjay to the CC list to comment on the endian change.
>
> regards,
> dan carpenter
>
>>
>> Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
>> ---
>> =A0drivers/net/ethernet/qlogic/netxen/netxen_nic_hw.c | =A0 =A07 ++++---
>> =A01 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/qlogic/netxen/netxen_nic_hw.c b/driver=
s/net/ethernet/qlogic/netxen/netxen_nic_hw.c
>> index 0f81287..7ea930b 100644
>> --- a/drivers/net/ethernet/qlogic/netxen/netxen_nic_hw.c
>> +++ b/drivers/net/ethernet/qlogic/netxen/netxen_nic_hw.c
>> @@ -1069,7 +1069,8 @@ int netxen_get_flash_mac_addr(struct netxen_adapte=
r *adapter, u64 *mac)
>>
>> =A0int netxen_p3_get_mac_addr(struct netxen_adapter *adapter, u64 *mac)
>> =A0{
>> - =A0 =A0 uint32_t crbaddr, mac_hi, mac_lo;
>> + =A0 =A0 uint32_t crbaddr;
>> + =A0 =A0 u64 mac_hi, mac_lo;
>> =A0 =A0 =A0 int pci_func =3D adapter->ahw.pci_func;
>>
>> =A0 =A0 =A0 crbaddr =3D CRB_MAC_BLOCK_START +
>> @@ -1079,9 +1080,9 @@ int netxen_p3_get_mac_addr(struct netxen_adapter *=
adapter, u64 *mac)
>> =A0 =A0 =A0 mac_hi =3D NXRD32(adapter, crbaddr+4);
>>
>> =A0 =A0 =A0 if (pci_func & 1)
>> - =A0 =A0 =A0 =A0 =A0 =A0 *mac =3D le64_to_cpu((mac_lo >> 16) | ((u64)ma=
c_hi << 16));
>> + =A0 =A0 =A0 =A0 =A0 =A0 *mac =3D (mac_lo >> 16) | (mac_hi << 16);
>> =A0 =A0 =A0 else
>> - =A0 =A0 =A0 =A0 =A0 =A0 *mac =3D le64_to_cpu((u64)mac_lo | ((u64)mac_h=
i << 32));
>> + =A0 =A0 =A0 =A0 =A0 =A0 *mac =3D mac_lo | (mac_hi << 32);
>>
>> =A0 =A0 =A0 return 0;
>> =A0}
>> --
>> 1.7.4.4
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe kernel-janitor=
s" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
