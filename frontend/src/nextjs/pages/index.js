import { useEffect } from 'react';
import { useRouter } from 'next/router';
import Head from 'next/head';

export default function LoginPage({ liff, liffError }) {
  const router = useRouter();

  useEffect(() => {
    if (!liff) return;
    if (liff.isLoggedIn()) {
      router.push('/home');
    }
  }, [liff, router]);

  const login = () => {
    if (!liff) return;
    const redirectUri = new URL('/home', window.location.origin).href;
    liff.login({ redirectUri });
  };

  return (
    <div>
        <Head>
            <title>LINEkUp - Login</title>
        </Head>
        <div className="home">
            <h1>Welcome to LINEkUp</h1>
            <p>Please log in to continue.</p>
            {liffError && <p>LIFF Error: {liffError}</p>}
            <button onClick={login} className="button--primary">Login with LINE</button>
        </div>
    </div>
  );
}