From: Jon Paul Maloy <maloy@donjonn.com>
Date: Tue, 08 Jan 2008 15:34:58 +0000
Subject: RE : [tipc-discussion] /net/tipc/port.c: Use tipc_port_unlock
Message-Id: <335603.50794.qm@web707.biz.mail.mud.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0801041546220.1184@pc-041.diku.dk>
References: <Pine.LNX.4.58.0801041546220.1184@pc-041.diku.dk>
In-Reply-To: <Pine.LNX.4.58.0801041546220.1184@pc-041.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>, per.liden@ericsson.com, jon.maloy@ericsson.com, allan.stephens@windriver.com, tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I have no objections.
///jon

--- Julia Lawall <julia@diku.dk> a =E9crit=A0:

> From: Julia Lawall <julia@diku.dk>
>=20
> The file net/tipc/port.c takes a lock using the
> function tipc_port_lock and
> then releases the lock sometimes using
> tipc_port_unlock and sometimes using
> spin_unlock_bh(p_ptr->publ.lock).  tipc_port_unlock
> simply does the
> spin_unlock_bh, but it seems cleaner to use it
> everywhere.
>=20
>=20
> The problem was fixed using the following semantic
> patch.
> (http://www.emn.fr/x-info/coccinelle/)
>=20
> // <smpl>
> @@
> struct port *p_ptr;
> @@
>=20
>    p_ptr =3D tipc_port_lock(...)
>    ...
> (
>    p_ptr =3D tipc_port_lock(...);
> |
> ?- spin_unlock_bh(p_ptr->publ.lock);
> +  tipc_port_unlock(p_ptr);
> )
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <julia@diku.dk>
> ---
>=20
> diff -u -p a/net/tipc/port.c b/net/tipc/port.c
> --- a/net/tipc/port.c 2008-01-01 10:43:55.000000000
> +0100
> +++ b/net/tipc/port.c 2008-01-04 10:51:05.000000000
> +0100
> @@ -340,7 +340,7 @@ int tipc_portunreliable(u32 ref,
> unsigne
>  	if (!p_ptr)
>  		return -EINVAL;
>  	*isunreliable =3D port_unreliable(p_ptr);
> -	spin_unlock_bh(p_ptr->publ.lock);
> +	tipc_port_unlock(p_ptr);
>  	return TIPC_OK;
>  }
>=20
> @@ -369,7 +369,7 @@ int tipc_portunreturnable(u32
> ref, unsig
>  	if (!p_ptr)
>  		return -EINVAL;
>  	*isunrejectable =3D port_unreturnable(p_ptr);
> -	spin_unlock_bh(p_ptr->publ.lock);
> +	tipc_port_unlock(p_ptr);
>  	return TIPC_OK;
>  }
>=20
> @@ -843,7 +843,7 @@ static void
> port_dispatcher_sigh(void *d
>  				u32 peer_port =3D port_peerport(p_ptr);
>  				u32 peer_node =3D port_peernode(p_ptr);
>=20
> -				spin_unlock_bh(p_ptr->publ.lock);
> +				tipc_port_unlock(p_ptr);
>  				if (unlikely(!connected)) {
>  					if (unlikely(published))
>  						goto reject;
> @@ -867,7 +867,7 @@ static void
> port_dispatcher_sigh(void *d
>  		case TIPC_DIRECT_MSG:{
>  				tipc_msg_event cb =3D up_ptr->msg_cb;
>=20
> -				spin_unlock_bh(p_ptr->publ.lock);
> +				tipc_port_unlock(p_ptr);
>  				if (unlikely(connected))
>  					goto reject;
>  				if (unlikely(!cb))
> @@ -882,7 +882,7 @@ static void
> port_dispatcher_sigh(void *d
>  		case TIPC_NAMED_MSG:{
>  				tipc_named_msg_event cb =3D up_ptr->named_msg_cb;
>=20
> -				spin_unlock_bh(p_ptr->publ.lock);
> +				tipc_port_unlock(p_ptr);
>  				if (unlikely(connected))
>  					goto reject;
>  				if (unlikely(!cb))
> @@ -913,7 +913,7 @@ err:
>  				u32 peer_port =3D port_peerport(p_ptr);
>  				u32 peer_node =3D port_peernode(p_ptr);
>=20
> -				spin_unlock_bh(p_ptr->publ.lock);
> +				tipc_port_unlock(p_ptr);
>  				if (!connected || !cb)
>  					break;
>  				if (msg_origport(msg) !=3D peer_port)
> @@ -929,7 +929,7 @@ err:
>  		case TIPC_DIRECT_MSG:{
>  				tipc_msg_err_event cb =3D up_ptr->err_cb;
>=20
> -				spin_unlock_bh(p_ptr->publ.lock);
> +				tipc_port_unlock(p_ptr);
>  				if (connected || !cb)
>  					break;
>  				skb_pull(buf, msg_hdr_sz(msg));
> @@ -942,7 +942,7 @@ err:
>  				tipc_named_msg_err_event cb >  					up_ptr->named_err_cb;
>=20
> -				spin_unlock_bh(p_ptr->publ.lock);
> +				tipc_port_unlock(p_ptr);
>  				if (connected || !cb)
>  					break;
>  				dseq.type =3D  msg_nametype(msg);
> @@ -1107,7 +1107,7 @@ int tipc_portimportance(u32
> ref, unsigne
>  	if (!p_ptr)
>  		return -EINVAL;
>  	*importance =3D (unsigned
> int)msg_importance(&p_ptr->publ.phdr);
> -	spin_unlock_bh(p_ptr->publ.lock);
> +	tipc_port_unlock(p_ptr);
>  	return TIPC_OK;
>  }
>=20
> @@ -1122,7 +1122,7 @@ int
> tipc_set_portimportance(u32 ref, uns
>  	if (!p_ptr)
>  		return -EINVAL;
>  	msg_set_importance(&p_ptr->publ.phdr, (u32)imp);
> -	spin_unlock_bh(p_ptr->publ.lock);
> +	tipc_port_unlock(p_ptr);
>  	return TIPC_OK;
>  }
>=20
>=20
>
-------------------------------------------------------------------------
> This SF.net email is sponsored by: Microsoft
> Defy all challenges. Microsoft(R) Visual Studio
> 2005.
>
http://clk.atdmt.com/MRT/go/vse0120000070mrt/direct/01/
> _______________________________________________
> tipc-discussion mailing list
> tipc-discussion@lists.sourceforge.net
>
https://lists.sourceforge.net/lists/listinfo/tipc-discussion
>=20

-
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
