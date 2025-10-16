import { useState, useEffect } from 'react';
import { useRouter } from 'next/router';
import Head from 'next/head';

export default function HomePage({ liff, liffError }) {
  const [profile, setProfile] = useState(null);
  const router = useRouter();

  useEffect(() => {
    if (!liff) return;
    if (!liff.isLoggedIn()) {
      router.push('/'); // Redirect to login page if not logged in
      return;
    }
    const getProfile = async () => {
      try {
        const userProfile = await liff.getProfile();
        setProfile(userProfile);
      } catch (err) {
        console.error(err);
      }
    };
    getProfile();
  }, [liff, router]);

  const logout = () => {
    if (!liff) return;
    liff.logout();
    router.push('/');
  };

  if (liffError) {
    return (
        <div>
            <Head>
                <title>LINEkUp</title>
            </Head>
            <div className="home">
                <h1>Error</h1>
                <p>{liffError}</p>
            </div>
        </div>
    )
  }

  if (!profile) {
    return (
        <div>
            <Head>
                <title>LINEkUp</title>
            </Head>
            <div className="home">
                <p>Loading...</p>
            </div>
        </div>
    );
  }

  return (
    <div>
        <Head>
            <title>LINEkUp</title>
        </Head>
        <div className="home">
            <h1>Welcome to LINEkUp!</h1>
            <p>Hello, {profile.displayName}!</p>
            {profile.pictureUrl && (
                <img
                src={profile.pictureUrl}
                alt="Profile"
                style={{ width: '100px', height: '100px', borderRadius: '50%' }}
                />
            )}
            <br />
            <button onClick={logout} className="button--primary">Logout</button>
        </div>
    </div>
  );
}
