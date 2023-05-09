import './ProfileAvatar.css';

export default function ProfileAvatar(props) {
  const backgroundImage = `url("https://assets.crudders.click/avatars/${props.id}.jpg")`;
  const styles = {
    // background: 'rgb(149,0,255)',
    // height: '40px',
    // width: '40px',
    // 'border-radius': '999px',
    // 'flex-shrink': 0,
    backgroundImage: backgroundImage,
    backgroundSize: 'cover',
    backgroundPosition: 'center',
  };

  return (
    <div 
      className="profile-avatar"
      style={styles}
    ></div>
  );
}